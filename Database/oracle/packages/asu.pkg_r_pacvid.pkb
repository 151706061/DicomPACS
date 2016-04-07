DROP PACKAGE BODY ASU.PKG_R_PACVID
/

--
-- PKG_R_PACVID  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACVID" 
 is-- Created by TimurLan

  FUNCTION DO_CALC_REPORT(pFK_VRACHID IN NUMBER,pFK_PACVID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacVid.dpr
    CURSOR cPacVid is SELECT FC_NAME FROM TPACVID WHERE FK_ID = pFK_PACVID;
    CURSOR cMain is
      SELECT FC_FAM,FC_IM
        FROM TKARTA
       WHERE FP_TEK_COC = 2
         AND FK_PACVID = pFK_PACVID
    ORDER BY FP_SEX DESC,FC_FAM;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2 (32767);
    PACVID_NAME VARCHAR(30);
  BEGIN
    open cPacVid;
    fetch cPacVid into PACVID_NAME;
    close cPacVid;

    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Список отряда №'|| PACVID_NAME,
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<body><div class=user>'||
         '<p align=center><B>ДОЦ "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'"<BR>Список отряда №'|| PACVID_NAME ||'</B></p><BR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<table><tr>'||
         '<td><p>№ п.п.</p></td>'||
         '<td><p>Фамилия</p></td>'||
         '<td><p>Имя</p></td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    for p in cMain loop
      str:='<tr><td style=''text-align:right''><p>'||cMain%ROWCOUNT||'.</p></td>'||
           '<td class=user><p>'||p.FC_FAM||'</p></td>'||
           '<td class=user><p>'||PKG_R_ALLFUNC.RETURN_VALUE(p.FC_IM)||'</p></td></tr>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    end loop;

    str:='</table>'||
         '<BR><P><B>Отчет составил:___________________ '|| DO_VRACHFIO (pFK_VRACHID)||
         '<BR>'|| TO_CHAR(SYSDATE,'dd.mm.yyyy') ||' г.</B></P></div></body></html>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;

end PKG_R_PACVID;
/

SHOW ERRORS;


