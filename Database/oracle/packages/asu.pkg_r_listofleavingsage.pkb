DROP PACKAGE BODY ASU.PKG_R_LISTOFLEAVINGSAGE
/

--
-- PKG_R_LISTOFLEAVINGSAGE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_LISTOFLEAVINGSAGE" -- Created by TimurLan
 IS

  FUNCTION DO_CALC_REPORT(pFD_DATA IN DATE,pFK_VRACHID IN NUMBER,pFK_VID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rListOfLeavingsAGE.dpr
    CURSOR cVid is SELECT FC_VID FROM TVID WHERE FK_ID = pFK_VID;
    CURSOR c12 IS
      SELECT /*+ rule*/TPEOPLES.FC_FAM,
             TPEOPLES.FC_IM,
             TPEOPLES.FC_DOCSER ||' '|| TPEOPLES.FC_DOCNUM FC_DOC,
             TO_CHAR(TPEOPLES.FD_ROJD,'dd.mm.yyyy') FD_ROJD,
             GET_SUBVIDNAME (TKARTA.FK_KOD) FC_SUBVID/*,
             GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID*/
        FROM TKARTA,TPEOPLES
       WHERE TKARTA.FK_KOD2 = pFK_VID
         AND TRUNC(GET_PACPLANOUTCOME(TKARTA.FK_ID)) = pFD_DATA
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(TKARTA.FK_ID,pFD_DATA) < 12
         AND TKARTA.FK_PEPLID=TPEOPLES.FK_ID
    ORDER BY TPEOPLES.FC_FAM;
    CURSOR c12plus IS
      SELECT /*+ rule*/TPEOPLES.FC_FAM,
             TPEOPLES.FC_IM,
             TPEOPLES.FC_DOCSER ||' '|| TPEOPLES.FC_DOCNUM FC_DOC,
             TO_CHAR(TPEOPLES.FD_ROJD,'dd.mm.yyyy') FD_ROJD,
             GET_SUBVIDNAME (TKARTA.FK_KOD) FC_SUBVID/*,
             GET_PACSUBVID(TKARTA.FK_KOD2,TKARTA.FK_KOD) FC_VID*/
        FROM TKARTA,TPEOPLES
       WHERE TKARTA.FK_KOD2 = pFK_VID
         AND TRUNC(GET_PACPLANOUTCOME(TKARTA.FK_ID)) = pFD_DATA
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(TKARTA.FK_ID,pFD_DATA) >= 12
         AND TKARTA.FK_PEPLID=TPEOPLES.FK_ID
    ORDER BY TPEOPLES.FC_FAM;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2(32767);
    VID_NAME VARCHAR(30);
    nTemp NUMBER;
    n NUMBER;
  BEGIN
    open cVid;
    fetch cVid into VID_NAME;
    close cVid;

    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Список отъезжающих',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BODY><DIV class=user>'||
         '<P ALIGN=CENTER><B>ДОЦ "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>'||
         'Список отъезжающих детей на '||TO_CHAR(pFD_DATA,'dd.mm.yyyy')||'</B></P>'||
         '<p align=center>(Тип прибытия: "'|| VID_NAME ||'")</p><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P>№ п.п.</P></TD>'||
         '<TD><P>Фамилия</P></TD>'||
         '<TD><P>Имя</P></TD>'||
         '<TD><P>Документ</P></TD>'||
         '<TD><P>Дата рождения</P></TD>'||
         '<TD><P>Подразделение</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<tr><td COLSPAN=6><p><U>До 12 лет:</U></p></td></tr>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    n := 0;
    FOR p IN c12 LOOP
      Inc(n);
      str:='<tr><td style=''text-align:right''><p>'|| n ||'.</p></td>'||
           '<TD class=user><P>'|| p.FC_FAM ||'</P></TD>'||
           '<TD class=user><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_IM ) ||'</P></TD>'||
           '<TD class=user><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_DOC ) ||'</P></TD>'||
           '<TD><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FD_ROJD ) ||'</P></TD>'||
           '<TD style=''text-align:right''><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_SUBVID ) ||'</P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;

    str:='<tr><td style=''text-align:right'' COLSPAN=5><p>ИТОГО:</p></td>'||
         '<TD style=''text-align:right''><P>'|| n ||'</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<tr><td COLSPAN=6><p><U>Старше 12 лет:</U></p></td></tr>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    nTemp := n;
    FOR p IN c12plus LOOP
      Inc(n);
      str:='<tr><td style=''text-align:right''><p>'|| n ||'.</p></td>'||
           '<TD class=user><P>'|| p.FC_FAM ||'</P></TD>'||
           '<TD class=user><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_IM ) ||'</P></TD>'||
           '<TD class=user><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_DOC ) ||'</P></TD>'||
           '<TD><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FD_ROJD ) ||'</P></TD>'||
           '<TD style=''text-align:right''><P>'|| PKG_R_ALLFUNC.RETURN_VALUE( p.FC_SUBVID ) ||'</P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    END LOOP;

    str:='<tr><td style=''text-align:right'' COLSPAN=5><p>ИТОГО:</p></td>'||
         '<TD style=''text-align:right''><P>'|| TO_CHAR(n - nTemp) ||'</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<tr><td style=''text-align:right'' COLSPAN=5><p>ВСЕГО:</p></td>'||
         '<TD style=''text-align:right''><P>'|| n ||'</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='</TABLE>'||
         '<BR><P><B>Отчет составил:_____________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;

END;
/

SHOW ERRORS;


