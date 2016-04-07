DROP PACKAGE BODY ASU.PKG_R_INCOME
/

--
-- PKG_R_INCOME  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_INCOME" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER) RETURN NUMBER
   IS-- Used in rIncome.dpr
    CURSOR c (pFK_KOD2 IN NUMBER)
     IS
      SELECT TKARTA.FC_PUT,GET_PACFIO(TKARTA.FK_ID) FC_FIO,
             GET_PACFULLWORKPLACE(TKARTA.FK_ID) FC_RABOTA,
             FD_DATA1,FD_DATA2,FN_KOL,TKARTA.FN_SUM,PKG_REGIST_PEPLFUNC.GET_PEPL_INSURANCE(FK_PEPLID) FC_INSURANCE
        FROM TKARTA,TSROKY
       WHERE TSROKY.FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB=2
         AND TKARTA.FK_ID=TSROKY.FK_PACID
         AND FK_KOD2=pFK_KOD2
       ORDER BY FD_DATA1,FC_FIO;
    CURSOR cVid IS SELECT * FROM TVID ORDER BY FK_ID;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    nSum Number(15,2);
    nItogo Number(15,2);
    nNum NUMBER;
    counter NUMBER;
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','Сведения о прибывших за период в санаторий "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'" за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,'landscape',
                             null,null,null,null,
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<BODY>' ||
      '<P ALIGN="CENTER"><B>Сведения о прибывших за период в санаторий "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"</B><BR>'||
      'за период с ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<table>'||
      '<tr>'||
      '<TD width="3%">№ п/п:</td>'||
      '<TD>Путевка:</td>'||
      '<TD>Полис:</td>'||
      '<TD>Ф.И.О.:</td>'||
      '<TD>Место работы, должность:</td>'||
      '<TD>С:</td>'||
      '<TD>На:</td>'||
      '<TD>По:</td>'||
      '<TD>Сумма:</td>'||
      '</tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    nItogo:=0;
    nNum:=0;
    FOR p IN cVid LOOP
      nSum:=0;
      str:='<TR><TD COLSPAN=9><P class=user><U>'||p.FC_VID||'</U></P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      counter:=0;
      str:='';
      FOR n IN c(p.FK_ID) LOOP
        Inc(nNum);
        Inc(counter);
        str:=str||'<TR><TD class=user><P class=user>'||TO_CHAR(nNum)||'.</P></TD>'||
             '<TD class=user style=''mso-number-format:"\@";''><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_PUT)||'</P></TD>'||
             '<TD style=''text-align:left''><P class=user>'||n.FC_INSURANCE||'</P></TD>'||
             '<TD style=''text-align:left''><P class=user>'||n.FC_FIO||'</P></TD>'||
             '<TD style=''text-align:left''><P class=user>'||PKG_R_ALLFUNC.RETURN_VALUE(n.FC_RABOTA)||'</P></TD>'||
             '<TD><P class=user>'||TO_CHAR(n.FD_DATA1,'dd.mm.yyyy')||'</P></TD>'||
             '<TD><P class=user>'||TO_CHAR(n.FN_KOL)||'</P></TD>'||
             '<TD><P class=user>'||TO_CHAR(n.FD_DATA2,'dd.mm.yyyy')||'</P></TD>'||
             '<TD class=user style=''mso-number-format:"\#\,\#\#0\.00";''><P class=user>'||TO_CHAR(n.FN_SUM)||'</P></TD></TR>';
        nSum:=nSum+n.FN_SUM;
        if counter=50 then
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          counter:=0;
          str:='';
        end if;--DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      END LOOP;
      if str is not null then
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      end if;
      str := '<TR><TD COLSPAN=8 class=user><P class=user>'||'Итого:'||'</P></TD><TD class=user style=''mso-number-format:"\#\,\#\#0\.00";''><P class=user>'||TO_CHAR(nSum)||'</P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      nItogo:=nItogo+nSum;
    END LOOP;
    str:='<TR><TD COLSPAN=8 class=user><P class=user>'||'Итого:'||'</P></TD><TD class=user style=''mso-number-format:"\#\,\#\#0\.00";''><P class=user>'||TO_CHAR(nItogo)||'</P></TD></TR>'||
         '</TABLE><BR><P><B>Отчет составил: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B><BR>'||
         '<B>Главный врач: _________________________ </B><BR>'||
         '<B>Главный бухгалтер: _________________________ </B><BR></P></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_INCOME;
/

SHOW ERRORS;


