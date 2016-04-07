DROP PACKAGE BODY ASU.PKG_R_FULLSTAT
/

--
-- PKG_R_FULLSTAT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_FULLSTAT" 
 is-- Created by TimurLan
  FUNCTION GET_KDNV_RECOVER(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM (FN_KOL)
        FROM tsroky
       WHERE fk_pryb = 4
         AND fn_kol > 0
         AND fd_data1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_RECOVER(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+PKG_R_ALLFUNC.GET_COUNT_RECOVER(pFD_DATA1+i);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_KDN (pFD_DATAC IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      select /*+ rule*/count(*) as fn_count
        from (select fk_pacid
                from tsroky
               where (((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                  OR (pFD_DATAC between FD_DATA1 and FD_DATA3)
                  OR ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC > FD_DATA1))
                 and fk_pryb in (1,3,7)
               UNION
              select fk_pacid
                from tsroky
               where (((FD_DATA1 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC < FD_DATA3)
                  OR ((FD_DATA3 between pFD_DATAC and pFD_DATAC+1-1/(24*60*60)) and pFD_DATAC = FD_DATA1))
                 and fk_pryb not in (5,6));
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_KDN (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+PKG_R_KDNFUNC.GET_KDN(pFD_DATA1+i);
    END LOOP;
    RETURN S;
  END;

  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rFullStat.dpr
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    i NUMBER;
    j NUMBER;
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Общая статистика по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY><DIV class=user>'||
          '<P align="CENTER"><B>Общая статистика по санаторию "' ||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR> за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P><BR>'||
          '<table>'||
          '<TR>'||
          ' <TD><p class=user>&nbsp;</p></TD>'||
          ' <TD><p class=user>Койко-дней:</p></TD>'||
          ' <TD><p class=user>Человек:</p></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    i:=PKG_R_KDNFUNC.GET_KDN(pFD_DATA1, pFD_DATA2);
    j:=PKG_R_ALLFUNC.GET_COUNT_OUT(pFD_DATA1, pFD_DATA2);
    str :='<TR>'||
          ' <TD style=''text-align:left''><p class=user>Фактически проведено</p></TD>'||
          ' <TD><p class=user>'|| i ||'</p></TD>'||
          ' <TD><p class=user>'|| j ||'</p></TD>'||
          '</TR>'||
          '<TR>'||
          ' <TD style=''text-align:left''><p class=user>Опозданий</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_KDNFUNC.GET_KDNV_OPOZD(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_ALLFUNC.GET_COUNTV_OPOZD(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          '</TR>'||
          '<TR>'||
          ' <TD style=''text-align:left''><p class=user>Досрочных</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_KDNFUNC.GET_KDNV_EARLY(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_ALLFUNC.GET_COUNTV_EARLY(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          '</TR>'||
          '<TR>'||
          ' <TD style=''text-align:left''><p class=user>Продлений</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_KDNFUNC.GET_KDNV_PRODL(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          ' <TD><p class=user>'|| PKG_R_ALLFUNC.GET_COUNTV_PRODL(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          '</TR>'||
          '<TR>'||
          ' <TD style=''text-align:left''><p class=user>Восстановлений</p></TD>'||
          ' <TD><p class=user>'|| GET_KDNV_RECOVER(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          ' <TD><p class=user>'|| GET_COUNT_RECOVER(pFD_DATA1, pFD_DATA2) ||'</p></TD>'||
          '</TR></table><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str  := '<PRE>Койко-дней по путевкам _________________________ '|| GET_KDN (pFD_DATA1, pFD_DATA2) ||'</PRE>'||
            '<PRE>План поступления за период, человек ____________ ____</PRE>'||
            '<PRE>Число фактически поступивших человек ___________ '|| j ||'</PRE>'||
            '<PRE>Процент выполнения плана _______________________ ____</PRE>'||
            '<PRE>Остаток койко-дней предыдущего периода _________ '|| PKG_R_KDNFUNC.GET_KDN_PEREHOD(pFD_DATA1-1)||'</PRE>'||
            '<PRE>Койко-дни, переходящие на следущий период ______ '|| PKG_R_KDNFUNC.GET_KDN_PEREHOD(pFD_DATA2)||'</PRE>'||
            '<PRE>Плановое число коек в санатории ________________ ____</PRE>'||
            '<PRE>Максимально возможное число койко-дней за период ____</PRE>'||
            '<PRE>Процент недоиспользования коечного фонда _______ ____</PRE>'||
            '<PRE>Число дней работы койки за период ______________ ____</PRE>'||
            '<PRE>Процент выполнения плана _______________________ ____</PRE>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    if j <> 0 then
      str  := '<PRE>Средняя длительность пребывания в санатории ____ '|| ROUND(i/j) ||'</PRE>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    end if;

    str  := '<BR><P><B>Отчет составил_________________________' || DO_VRACHFIO (pFK_VRACHID);
    str  := str || '</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
--  do_log(sysdate,'END of function is reached!');
    RETURN nC;
  END;
end PKG_R_FULLSTAT;
/

SHOW ERRORS;


