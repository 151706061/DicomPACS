DROP PACKAGE BODY ASU.PKG_R_DIAGGALOB
/

--
-- PKG_R_DIAGGALOB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_DIAGGALOB" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rDiagGalob.dpr
    CURSOR cMain is
      SELECT TDIAG.FD_DATE,
             PKG_REGIST_PACFUNC.GET_PAC_IB(TDIAG.FK_PACID) FC_IBID,
             PKG_REGIST_PACFUNC.GET_PAC_FIO(TDIAG.FK_PACID) FC_FIO,
             GET_SOTRNAME(TDIAG.FK_VRACHID) FC_VRACH,
             PKG_REGIST_PACFUNC.REPLACE_SPACES(DO_DIAGBYTYPE(TDIAG.FK_PACID, TDIAG.FP_TYPE, TDIAG.FL_MAIN)) FC_DIAG,
             TSMID.FK_MKB10,
             REPLACE(PKG_REGIST_PACFUNC.REPLACE_SPACES(REPLACE(GET_IBRAZDELTEXT(TDIAG.FK_PACID,GET_GALOBID),CHR (10),'')),' .','. ') FC_GALOB
        FROM TDIAG,TSMID
       WHERE FD_DATE BETWEEN pFD_DATA1 AND pFD_DATA2
         AND FP_TYPE = 2
         AND FL_MAIN = 1
         AND TSMID.FK_ID = TDIAG.FK_SMDIAGID(+)
       ORDER BY TDIAG.FD_DATE;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','Список соответствия диагнозов и жалоб пациентов по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             '20','10','10','10',
                             null,null,null,'right',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER"><B>Список соответствия диагнозов и жалоб пациентов санатория "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"<BR>за период c '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' по '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy')||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P>№ И.Б.</P></TD>'||
         '<TD><P>Пациент</P></TD>'||
         '<TD><P>Врач</P></TD>'||
         '<TD><P>Код МКБ-10</P></TD>'||
         '<TD><P>Диагноз</P></TD>'||
         '<TD><P>Жалобы</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    FOR c in cMain LOOP
      str:='<TR><td class=user><P class=user>'|| c.FC_IBID ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| c.FC_FIO ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| c.FC_VRACH ||'</P></TD>'||
           '<td><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(c.FK_MKB10) ||'</P></TD>'||
           --'<td><P class=user>'|| TO_CHAR(c.FD_DATA1,'dd.mm.yyyy') ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| c.FC_DIAG ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| PKG_R_ALLFUNC.RETURN_VALUE(c.FC_GALOB) ||'</P></TD></TR>';
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


