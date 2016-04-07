DROP PACKAGE BODY ASU.PKG_R_CHILDREN_GORKA
/

--
-- PKG_R_CHILDREN_GORKA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_CHILDREN_GORKA" 
 IS-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rChildrenGorka.dpr
    CURSOR cGroup
     IS SELECT FN_SUM
          FROM TKARTA
         WHERE FK_ID IN
                       (SELECT FK_PACID
                          FROM TSROKY
                         WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
                           AND FK_PRYB = 2
                           AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) < 14)
         GROUP BY FN_SUM;
    CURSOR cChildren(pFN_SUM IN NUMBER)
     IS SELECT rownum,GET_IB(FK_ID) as FC_IB,PKG_REGIST_PACFUNC.GET_PAC_FULLFIO(FK_ID) as FC_FIO,GET_PACFCPALATA(FK_ID) as FC_PALATA,FC_PUT/*,FN_SUM*/
          FROM TKARTA
         WHERE FK_ID IN
                       (SELECT FK_PACID
                          FROM TSROKY
                         WHERE FD_DATA1 BETWEEN pFD_DATA1 and pFD_DATA2+1-1/(24*60*60)
                           AND FK_PRYB = 2
                           AND PKG_REGIST_PACFUNC.GET_PAC_AGE_DATE(FK_PACID,FD_DATA1) < 14)
           AND FN_SUM = pFN_SUM;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','������ ����� ��������� � ��������� "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"',
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
         '<P ALIGN="CENTER">������ �����, ��������� � ��������� "'|| PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������') ||'"<BR>�� ������ � '|| TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') ||' �� '|| TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') ||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    str:='<TABLE><TR><td><P>� �/�</P></TD>'||
         '<td><P>� �.�.</P></TD>'||
         '<td>�.�.�.</P></TD>'||
         '<td><P>������:</P></TD>'||
         '<td><P>�������:</P></TD></TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    FOR k in cGroup LOOP
      str:='<TR><TD colspan="5"><P><U>�� ���������� ������� ������ '||k.FN_SUM||' ���.</U></P></TD></TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      FOR p in cChildren(k.FN_SUM) LOOP
        str:='<TR><td class=user><P class=user>'||p.rownum||'</P></TD>'||
             '<td class=user><P class=user>'||p.FC_IB||'</P></TD>'||
             '<td style=''text-align:left''><P class=user>'||p.FC_FIO||'</P></TD>'||
             '<td class=user><P class=user>'||p.FC_PALATA||'</P></TD>'||
             '<td class=user><P class=user>'||p.FC_PUT||'</P></TD></TR>';
        DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      END LOOP;
    END LOOP;
    str:='</TABLE><BR><P><B>����� ��������: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


