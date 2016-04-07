DROP PACKAGE BODY ASU.PKG_R_CHILDREN
/

--
-- PKG_R_CHILDREN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_CHILDREN" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rChildren.dpr
    CURSOR cCountAll
     IS
      SELECT COUNT(FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) < 15;
    CURSOR cCountUpTo7
     IS
      SELECT COUNT(FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) < 7;
    CURSOR cCountFrom7UpTo14
     IS
      SELECT COUNT(FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) >= 7
         AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) <= 14;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
    nVar1 NUMBER;
    nVar2 NUMBER;
    nVar3 NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Сведения о количестве детей по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','20','20',
                             '50.0','None','None','right',
                             null,'None','None',null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER">Санаторий "'|| PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен') ||'"</P><BR>'||
         '<P ALIGN="CENTER">Дети, побывавшие в санатории за период с '|| TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') ||' по '|| TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') ||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    Open cCountAll;
    Fetch cCountAll into nVar1;
    Close cCountAll;
    Open cCountUpTo7;
    Fetch cCountUpTo7 into nVar2;
    Close cCountUpTo7;
    Open cCountFrom7UpTo14;
    Fetch cCountFrom7UpTo14 into nVar3;
    Close cCountFrom7UpTo14;
    str:='<TABLE class=user><TR><td class=user><P>Всего:</P></TD>'||
         '<td class=user><P>'|| nVar1 ||'</P></TD></TR>'||
         '<TR><td class=user><P>Из них до 7:</P></TD>'||
         '<td class=user><P>'|| nVar2 ||'</P></TD></TR>'||
         '<TR><td class=user><P>с 7 до 14:</P></TD>'||
         '<td class=user><P>'|| nVar3 ||'</P></TD></TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


