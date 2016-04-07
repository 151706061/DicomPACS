DROP PACKAGE BODY ASU.PKG_R_LOGPRODL
/

--
-- PKG_R_LOGPRODL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_LOGPRODL" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rLogProdl.dpr
    CURSOR cMain is
      SELECT *
        FROM TLOG
       WHERE FC_TABLE = 'TSROKY'
         AND FC_FIELD = 'FK_PRYB'
         AND (FC_NEW = '5' OR FC_NEW = '6')
         AND FD_LOGONTIME BETWEEN pFD_DATA1 AND pFD_DATA2
       ORDER BY FK_ID;
    CURSOR cInsOld(pFK_ID IN NUMBER) is
      SELECT *
        FROM TLOG
       WHERE FK_ID BETWEEN pFK_ID - 2 AND pFK_ID + 5
       ORDER BY FK_ID;
    CURSOR cUpdOld(pFK_ID IN NUMBER) is
      SELECT *
        FROM TLOG
       WHERE FK_ID BETWEEN pFK_ID - 2 AND pFK_ID + 4
       ORDER BY FK_ID;
    CURSOR cIns(pFK_ID IN NUMBER) is
      SELECT *
        FROM TLOG
       WHERE FK_ID BETWEEN pFK_ID - 200 AND pFK_ID + 500
       ORDER BY FK_ID;
    CURSOR cUpd(pFK_ID IN NUMBER) is
      SELECT *
        FROM TLOG
       WHERE FK_ID BETWEEN pFK_ID - 200 AND pFK_ID + 400
       ORDER BY FK_ID;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    --nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Список пациентов продливших сроки проживания по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>Список пациентов продливших сроки проживания по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||
         '" на '||TO_CHAR(SYSDATE,'dd.mm.yyyy')||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD colspan=2><P>Пациент</P></TD>'||
         '<TD colspan=3><P>Продление</P></TD>'||
         '<TD rowspan=2><P>Ф.И.О. сотрудника</P></TD></TR>'||
         '<TR><TD><P>№ И.Б.</P></TD>'||
         '<TD><P>Ф.И.О.</P></TD>'||
         '<TD><P>Причина</P></TD>'||
         '<TD><P>С:</P></TD>'||
         '<TD><P>По:</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    --nTemp:=0;
    FOR p in cMain LOOP
      IF p.FC_ACTION = 'INSERT' THEN
        str := '';
        IF TRUNC(p.FD_LOGONTIME) < TO_DATE('18.02.2004','dd.mm.yyyy') THEN
          FOR i in cInsOld(p.FK_ID) LOOP
            if i.FC_FIELD = 'FK_PACID' then
              str:=str||'<TR><td class=user><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_IB(TO_NUMBER(i.FC_NEW)) ||'</P></TD>'||
                        '<td style=''text-align:left''><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_FIO(TO_NUMBER(i.FC_NEW)) ||'</P></TD>';
            elsif i.FC_FIELD = 'FK_PRYB' then
              if i.FC_NEW = '5' then
                str:=str||'<td><P class=user>В счет опоздания</P></TD>';
              elsif i.FC_NEW = '6' then
                str:=str||'<td><P class=user>За наличный расчет</P></TD>';
              end if;
            elsif i.FC_FIELD = 'FD_DATA1' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            elsif i.FC_FIELD = 'FD_DATA3' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            end if;
          END LOOP;
        ELSE
          FOR i in cIns(p.FK_ID) LOOP
            if i.FC_FIELD = 'FK_PACID' then
              str:=str||'<TR><td class=user><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_IB(TO_NUMBER(i.FC_NEW)) ||'</P></TD>'||
                        '<td style=''text-align:left''><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_FIO(TO_NUMBER(i.FC_NEW)) ||'</P></TD>';
            elsif i.FC_FIELD = 'FK_PRYB' then
              if i.FC_NEW = '5' then
                str:=str||'<td><P class=user>В счет опоздания</P></TD>';
              elsif i.FC_NEW = '6' then
                str:=str||'<td><P class=user>За наличный расчет</P></TD>';
              end if;
            elsif i.FC_FIELD = 'FD_DATA1' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            elsif i.FC_FIELD = 'FD_DATA3' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            end if;
          END LOOP;
        END IF;
        str:=str||'<td class=user><P class=user>'|| GET_SOTRNAME(p.FN_USERID) ||'</P></TD></TR>';
        if TRIM(str) is not null then
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        end if;
      ELSIF p.FC_ACTION = 'UPDATE' THEN
        str := '';
        IF TRUNC(p.FD_LOGONTIME) < TO_DATE('18.02.2004','dd.mm.yyyy') THEN
          FOR i in cUpdOld(p.FK_ID) LOOP
            if i.FC_FIELD = 'FK_PACID' then
              str:=str||'<TR><td class=user><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_IB(TO_NUMBER(i.FC_NEW)) ||'</P></TD>'||
                        '<td style=''text-align:left''><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_FIO(TO_NUMBER(i.FC_NEW)) ||'</P></TD>';
            elsif i.FC_FIELD = 'FK_PRYB' then
              if i.FC_NEW = '5' then
                str:=str||'<td><P class=user>В счет опоздания</P></TD>';
              elsif i.FC_NEW = '6' then
                str:=str||'<td><P class=user>За наличный расчет</P></TD>';
              end if;
            elsif i.FC_FIELD = 'FD_DATA1' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            elsif i.FC_FIELD = 'FD_DATA3' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            end if;
          END LOOP;
        ELSE
          FOR i in cUpd(p.FK_ID) LOOP
            if i.FC_FIELD = 'FK_PACID' then
              str:=str||'<TR><td class=user><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_IB(TO_NUMBER(i.FC_NEW)) ||'</P></TD>'||
                        '<td style=''text-align:left''><P class=user>'|| PKG_REGIST_PACFUNC.GET_PAC_FIO(TO_NUMBER(i.FC_NEW)) ||'</P></TD>';
            elsif i.FC_FIELD = 'FK_PRYB' then
              if i.FC_NEW = '5' then
                str:=str||'<td><P class=user>В счет опоздания</P></TD>';
              elsif i.FC_NEW = '6' then
                str:=str||'<td><P class=user>За наличный расчет</P></TD>';
              end if;
            elsif i.FC_FIELD = 'FD_DATA1' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            elsif i.FC_FIELD = 'FD_DATA3' then
              str:=str||'<td><P class=user>'|| i.FC_NEW ||'</P></TD>';
            end if;
          END LOOP;
        END IF;
        str:=str||'<td class=user><P class=user>'|| GET_SOTRNAME(p.FN_USERID) ||'</P></TD></TR>';
        if TRIM(str) is not null then
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        end if;
      END IF;
    END LOOP;

    str:='</TABLE><BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


