DROP PACKAGE BODY ASU.PKG_R_PACMOVEMASH
/

--
-- PKG_R_PACMOVEMASH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_PACMOVEMASH" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rPacMoveMash.dpr
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
    nTemp NUMBER;
    s VARCHAR2 (100);
  BEGIN
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('word','����� � �������� ��������� �� ��������� "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"',
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<BODY><P ALIGN="CENTER"><B>����� � �������� ��������� �� ��������� "'||PKG_SMINI.READSTRING('CONFIG','S_NAME','�� ��������')||'"</B><BR>'||
          '�� ������ � ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') || '</P><BR>'||
          '<table>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str :='<TR>'||
          '<TD><B>����:</B></TD>'||
          '<TD><B>�������� �� ������ ���:</B></TD>'||
          '<TD><B>�������:</B></TD>'||
          '<TD><B>������:</B></TD>'||
          '<TD><B>������� �� ����� ���:</B></TD>'||
          '<TD><B>�/�:</B></TD>'||
          '<TD><B>�/���:</B></TD>'||
          '</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR d IN 0 .. pFD_DATA2 - pFD_DATA1 LOOP
      str:='<TR><TD>' || TO_CHAR (pFD_DATA1 + d, 'dd.mm.yyyy') || '</TD>';
--�������� �� ������ ���...
      str:=str||'<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA1 + d) );
      nTemp  := PKG_R_ALLFUNC.GET_COUNT_MORNING_AGE (pFD_DATA1 + d, 15, 0);
      IF nTemp > 0 THEN
        str  := str || '(' || PKG_R_ALLFUNC.RETURN_VALUE( nTemp )|| ')';
      END IF;
      str    := str || '</TD>';
--�������
      str    := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_PRYB (pFD_DATA1 + d) );
      s      := PKG_R_ALLFUNC.GET_COUNT_PRYB_AGE (pFD_DATA1 + d, 15, 0);
      IF PKG_R_ALLFUNC.RETURN_VALUE( s ) <> '&nbsp;' THEN
        str  := str || '(' || s || ')';
      END IF;
      str    := str || '</TD>';
--������
      str    := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_VYB (pFD_DATA1 + d) );
      s      := PKG_R_ALLFUNC.GET_COUNT_VYB_AGE (pFD_DATA1 + d, 15, 0);
      IF PKG_R_ALLFUNC.RETURN_VALUE( s ) <> '&nbsp;' THEN
        str  := str || '(' || s || ')';
      END IF;
      str    := str || '</TD>';
--�������� �� ����� ���...
      str    := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_ALLFUNC.GET_COUNT_MORNING (pFD_DATA1 + d + 1) );
      nTemp  := PKG_R_ALLFUNC.GET_COUNT_MORNING_AGE (pFD_DATA1 + d + 1, 15, 0);
      IF nTemp > 0 THEN
        str  := str || '(' || PKG_R_ALLFUNC.RETURN_VALUE( nTemp )|| ')';
      END IF;
      str    := str || '</TD>';
--��...
      str    := str || '<TD>';
      s      := PKG_R_KDNFUNC.GET_KDNV_EARLY(pFD_DATA1 + d);
      IF s = 0 THEN
        s  := '-';
      END IF;
      str    := str || s || '</TD>';
--���...
      str    := str || '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE( PKG_R_KDNFUNC.GET_KDN (pFD_DATA1 + d) )|| '</TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      PROGRESS_BAR.SETSTROUT (TO_CHAR (pFD_DATA1 + d, 'dd.mm.yyyy') );
      PROGRESS_BAR.STEPIT;
    END LOOP;
    str  :=
      '<TR><TD><B>�����:</B></TD>'||
      '<TD>&nbsp;</TD>'||
      '<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_PRYB (pFD_DATA1, pFD_DATA2) || '</B></TD>'||
      '<TD><B>' || PKG_R_ALLFUNC.GET_COUNT_VYB (pFD_DATA1, pFD_DATA2) || '</B></TD>'||
      '<TD>&nbsp;</TD>'||
      '<TD><B>' || PKG_R_KDNFUNC.GET_KDNV_EARLY(pFD_DATA1, pFD_DATA2) || '</B></td>'||
      '<TD><B>' || PKG_R_KDNFUNC.GET_KDN (pFD_DATA1, pFD_DATA2) || '</B></TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  := '</TABLE>'||
            '<BR><P><B>����� ��������: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></P></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_PACMOVEMASH;
/

SHOW ERRORS;


