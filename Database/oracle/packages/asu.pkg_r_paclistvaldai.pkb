DROP PACKAGE BODY ASU.PKG_R_PACLISTVALDAI
/

--
-- PKG_R_PACLISTVALDAI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACLISTVALDAI" 
 IS-- Created by TimurLan
  FUNCTION GET_PAC_PRODL(ppFD_DATA1 IN DATE,ppFD_DATA2 IN DATE,ppFK_PACID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
     SELECT FN_KOL
       FROM TSROKY
      WHERE FK_PACID = ppFK_PACID
        AND fd_data1 BETWEEN ppFD_DATA1 AND ppFD_DATA2+1-1/(24*60*60)
        AND fk_pryb IN (5,6);
    nTemp NUMBER;
  BEGIN
    Open c;
    Fetch c into nTemp;
    Close c;
    RETURN NVL(nTemp,0);
  END;
  FUNCTION GET_PAC_EARLY(ppFD_DATA1 IN DATE,ppFD_DATA2 IN DATE,ppFK_PACID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
     SELECT FN_KOL
       FROM TSROKY
      WHERE FK_PACID = ppFK_PACID
        AND fd_data1 BETWEEN ppFD_DATA1 AND ppFD_DATA2+1-1/(24*60*60)
        AND fk_pryb = 3;
    nTemp NUMBER;
  BEGIN
    Open c;
    Fetch c into nTemp;
    Close c;
    RETURN NVL(nTemp,0);
  END;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacListValdai.dpr
    CURSOR cMain IS
     SELECT /*+ rule*/ROWNUM,
            TKARTA.FK_ID,
            PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_ID) AS FC_FIO,
            PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(TKARTA.FK_ID,GET_PACINCOME(TKARTA.FK_ID)) AS FN_AGE,
            PKG_R_ALLFUNC.RETURN_VALUE(PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(TKARTA.FK_ID)) AS FC_RABOTA,
            TO_CHAR(GET_PACPLANINCOME(TKARTA.FK_ID),'dd.mm.yyyy') AS FD_DATA1,
            TO_CHAR(GET_PACINCOME(TKARTA.FK_ID),'dd.mm.yyyy') AS FD_DATA2,
            TO_CHAR(GET_PACDAYS(TKARTA.FK_ID)) AS FC_DAYS,
            TO_CHAR(GET_PACPLANOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy') AS FD_DATA3,
            PKG_R_ALLFUNC.RETURN_VALUE(TO_CHAR(GET_PACOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy')) AS FD_DATA4,
            PKG_R_ALLFUNC.RETURN_VALUE(TKARTA.FC_PUT) AS FC_PUT,
            PKG_R_ALLFUNC.RETURN_VALUE(TKARTA.FN_SUM) AS FN_SUM,
            PKG_R_ALLFUNC.RETURN_VALUE(GET_PAC_PRODL(pFD_DATA1,pFD_DATA2,TKARTA.FK_ID)) AS FN_PRODL,
            PKG_R_ALLFUNC.RETURN_VALUE(GET_PAC_EARLY(pFD_DATA1,pFD_DATA2,TKARTA.FK_ID)) AS FN_EARLY,
            PKG_R_ALLFUNC.RETURN_VALUE(PKG_REGIST_PACFUNC.GET_PAC_ADRSHORT(TKARTA.FK_ID)) AS FC_ADR,
            PKG_R_ALLFUNC.RETURN_VALUE(GET_PACFCKORP(TKARTA.FK_ID)) AS FC_KORP
       FROM TKARTA
      WHERE TKARTA.FK_ID IN
                         (SELECT FK_PACID
                            FROM TSROKY
                           WHERE (FD_DATA1 BETWEEN PFD_DATA1 AND PFD_DATA2+1-1/(24*60*60)
                              OR FD_DATA3 BETWEEN PFD_DATA1 AND PFD_DATA2+1-1/(24*60*60)
                              OR PFD_DATA1 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3)
                              OR PFD_DATA2 BETWEEN TRUNC(FD_DATA1) AND TRUNC(FD_DATA3))
                             AND FK_PRYB IN(2,4,5,6) )
      /*ORDER BY FC_FAM*/;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','Список проживающих по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'" за период с '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy'),
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>Список проживавших по санаторию "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>'||
         'в период c '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy')||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<table><TR>'||
         '<TD rowspan=2><P>№ п/п</P></TD>'||
         '<TD rowspan=2><P>Ф.И.О.</P></TD>'||
         '<TD rowspan=2><P>Возраст</P></TD>'||
         '<TD rowspan=2><P>Место работы</P></TD>'||
         '<TD colspan=2><P>Прибытие</P></TD>'||
         '<TD rowspan=2><P>Срок</P></TD>'||
         '<TD colspan=2><P>Убытие</P></TD>'||
         '<TD rowspan=2><P>№ путевки</P></TD>'||
         '<TD rowspan=2><P>Стоимость путевки</P></TD>'||
         '<TD rowspan=2><P>Продление (дней)</P></TD>'||
         '<TD rowspan=2><P>Доср.выбытие (дней)</P></TD>'||
         '<TD rowspan=2><P>Домашний адрес</P></TD>'||
         '<TD rowspan=2><P>Корпус</P></TD>'||
         '</TR>'||
         '<TR>'||
         '<TD><P>По путевке</P></TD>'||
         '<TD><P>Фактически</P></TD>'||
         '<TD><P>По путевке</P></TD>'||
         '<TD><P>Фактически</P></TD>'||
         '</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    FOR p in cMain LOOP
      str:='<TR>'||
           '<TD><P class=user>'||p.rownum||'</P></TD>'||
           '<TD class=user><P class=user>'||p.FC_FIO||'</P></TD>'||
           '<TD><P class=user>'||p.FN_AGE||'</P></TD>'||
           '<TD class=user><P class=user>'||p.FC_RABOTA||'</P></TD>'||
           '<TD><P class=user>'||p.FD_DATA1||'</P></TD>'||
           '<TD><P class=user>'||p.FD_DATA2||'</P></TD>'||
           '<TD><P class=user>'||p.FC_DAYS||'</P></TD>'||
           '<TD><P class=user>'||p.FD_DATA3||'</P></TD>'||
           '<TD><P class=user>'||p.FD_DATA4||'</P></TD>'||
           '<TD style=''text-align:right''><P class=user>'||p.FC_PUT||'</P></TD>'||
           '<TD style=''text-align:right''><P class=user>'||p.FN_SUM||'</P></TD>'||
           '<TD><P class=user>'||p.FN_PRODL||'</P></TD>'||
           '<TD><P class=user>'||p.FN_EARLY||'</P></TD>'||
           '<TD class=user><P class=user>'||p.FC_ADR||'</P></TD>'||
           '<TD style=''text-align:right''><P class=user>'||p.FC_KORP||'</P></TD>'||
           '</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;
    str:='</TABLE><BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


