DROP PACKAGE BODY ASU.PKG_REP_PROTIVDIAG
/

--
-- PKG_REP_PROTIVDIAG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REP_PROTIVDIAG" -- by PHP 11.04.2004
IS
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rActPeriod.dpr
    CURSOR cMain is select distinct vn.fd_naz fd_date, PKG_REGIST_PACFUNC.GET_PAC_FIO(td.fk_pacid) as pac,
       get_smidname(td.fk_smdiagid) diag,(get_fullpath(vn.fk_smid)||': '||PKG_NAZ.GET_NAZPARAM(vn.fk_id)) naz,
       do_vrachfio(vn.fk_vrachid)  vrach
       from tprotivdiag tp,tdiag td,vnaz vn
    where tp.fk_diag=td.fk_smdiagid and tp.fk_smid=vn.fk_smid and td.fk_pacid=vn.fk_pacid
     and vn.fd_naz between pFD_DATA1 and pFD_DATA2 -- and vn.fk_vrachid=pFK_VRACHID;
     order by FD_DATE;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','����� �� ����������������� ����������"' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"',
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
         '<P ALIGN="CENTER"><B>����� �� ����������������� ����������<BR>�� ��������� c '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||' �� '||TO_CHAR(pFD_DATA2,'dd.mm.yyyy')||' "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<table>'||
         '<TR><TD><P>� </P></TD>'||
         '<TD><P>�������</P></TD>'||
         '<TD><P>����</P></TD>'||
         '<TD><P>�������</P></TD>'||
         '<TD><P>����������</P></TD>'||
         '<TD><P>����</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    nTemp:=1;
    FOR c in cMain  LOOP
          str:='<TR><td style=''text-align:left''><P class=user>'|| nTemp ||'</P></TD>'||
               '<td><P class=user>'|| c.pac ||'</P></TD>'||
               '<td><P class=user>'|| TO_CHAR(c.fd_date,'dd.mm.yyyy') ||'</P></TD>'||
               '<td style=''text-align:left''><P class=user>'|| c.diag ||'</P></TD>'||
               '<td style=''text-align:left''><P class=user>'|| c.naz ||'</P></TD>'||
               '<td class=user><P class=user>'|| c.vrach ||'</P></TD></TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
          Inc(nTemp);
    END LOOP;
    str:='<TR><td colspan="6" style=''text-align:left''><P class=user><B>����� : '|| nTemp ||'</B></P></TD></TR></TABLE>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<BR><P><B>����� ��������: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


