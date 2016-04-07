DROP PACKAGE BODY ASU.PKG_R_NONAZ
/

--
-- PKG_R_NONAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_NONAZ" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATAC IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rAct.dpr
    CURSOR cMain is
      SELECT DISTINCT (FK_PACID),
                      PKG_REGIST_PACFUNC.GET_PAC_IB(FK_PACID) FC_IBID,
                      PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) FC_FIO,
                      PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(FK_PACID) FC_VRACH,
                      PKG_REGIST_PACFUNC.GET_PAC_FCPALATA(FK_PACID) FC_PALATA,
                      PKG_REGIST_PACFUNC.GET_PAC_INCOME(FK_PACID) FD_DATA1,
                      PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(FK_PACID) FD_DATA2
        FROM (select tdiag.fk_id d, vnaz.fk_id v, t.*
                from tdiag, vnaz,
                             (select fk_pacid
                                from tsroky
                               where (((FD_DATA1 between TRUNC(SYSDATE) and TRUNC(SYSDATE) + 1 - 1 / (24 * 60 * 60)) and TRUNC(SYSDATE) < FD_DATA3)
                                     OR TRUNC(SYSDATE) between FD_DATA1 and FD_DATA3)
                                     OR ((FD_DATA3 between TRUNC(SYSDATE) and TRUNC(SYSDATE) + 1 - 1 / (24 * 60 * 60)) and TRUNC(SYSDATE) > FD_DATA1)
                                     and fk_pryb not in (1, 3, 7)
                              union
                              select fk_pacid
                                from tsroky
                               where (((FD_DATA1 between TRUNC(SYSDATE) and TRUNC(SYSDATE) + 1 - 1 / (24 * 60 * 60)) and TRUNC(SYSDATE) < FD_DATA3)
                                     OR ((FD_DATA3 between TRUNC(SYSDATE) and TRUNC(SYSDATE) + 1 - 1 / (24 * 60 * 60)) and TRUNC(SYSDATE) = FD_DATA1))
                                     and fk_pryb in (5, 6) ) t
               where tdiag.fk_pacid(+) = t.fk_pacid
                 and vnaz.fk_pacid(+) = t.fk_pacid)
       WHERE (D IS NULL OR V IS NULL)
         AND TRUNC(SYSDATE)-TRUNC(PKG_REGIST_PACFUNC.GET_PAC_INCOME(FK_PACID)) >= TRUNC(SYSDATE) - pFD_DATAC
       ORDER BY FC_VRACH, FC_FIO;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('word','������ ��������� ��� ���������� � ��������� �� ��������� "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"',
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
         '<P ALIGN="CENTER"><B>������ ���������, ����������� � ��������� "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||
         '" �� '||TO_CHAR(SYSDATE,'dd.mm.yyyy')||'<BR> � �� �������� ������� �� ��������� '|| TO_CHAR(TRUNC(SYSDATE)-pFD_DATAC+1)|| ' ���� �� ��� ��������</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P>� �.�.</P></TD>'||
         '<TD><P>�.�.�. ��������</P></TD>'||
         '<TD><P>������� ����</P></TD>'||
         '<TD><P>� ������</P></TD>'||
         '<TD><P>��������</P></TD>'||
         '<TD><P>������</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    nTemp:=0;
    FOR c in cMain LOOP
      str:='<TR><td class=user><P class=user>'|| c.FC_IBID ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| c.FC_FIO ||'</P></TD>'||
           '<td style=''text-align:left''><P class=user>'|| c.FC_VRACH ||'</P></TD>'||
           '<td class=user><P class=user>'|| c.FC_PALATA ||'</P></TD>'||
           '<td><P class=user>'|| TO_CHAR(c.FD_DATA1,'dd.mm.yyyy') ||'</P></TD>'||
           '<td><P class=user>'|| TO_CHAR(c.FD_DATA2,'dd.mm.yyyy') ||'</P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      Inc(nTemp);
    END LOOP;

    str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>����� �� ���������: '|| nTemp ||'</B></P></TD></TR></TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BR><P><B>����� ��������: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


