DROP PACKAGE BODY ASU.PKG_R_COPS
/

--
-- PKG_R_COPS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_COPS" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rCops.dpr
    CURSOR cMain
     IS SELECT rownum,
               PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_ID) as FC_FIO,
               TO_CHAR(TKARTA.FD_ROJD,'dd.mm.yyyy') FD_ROJD,
               PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE(FK_ID) FC_WORK,
               PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(FK_ID) FC_ADR,
               TO_CHAR(GET_PACINCOME(FK_ID),'dd.mm.yyyy') ||' - '|| TO_CHAR(NVL( GET_PACOUTCOME(FK_ID),GET_PACPLANOUTCOME(FK_ID) ),'dd.mm.yyyy') FC_SROKY
          FROM TKARTA
         WHERE FK_ID IN
                       (SELECT FK_PACID
                          FROM TSROKY
                         WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
                           AND FK_PRYB = 2);
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','Список прибывших в санаторий "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             '20','10','20','20',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER">Список прибывших в санаторий "'|| PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен') ||'"<BR>за период с '|| TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') ||' по '|| TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') ||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<TABLE><TR><td><P>№ п/п</P></TD>'||
         '<td><P>Ф.И.О.</P></TD>'||
         '<td><P>Дата рождения</P></TD>'||
         '<td><P>Место работы</P></TD>'||
         '<td><P>Домашний адрес</P></TD>'||
         '<td><P>Сроки пребывания</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    FOR p in cMain LOOP
      str:='<TR><td class=user><P class=user>'||p.rownum||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'||p.FC_FIO||'</P></TD>'||
           '<td class=user><P class=user>'||p.FD_ROJD||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'||p.FC_WORK||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'||p.FC_ADR||'</P></TD>'||
           '<td class=user><P class=user>'||p.FC_SROKY||'</P></TD></TR>';
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


