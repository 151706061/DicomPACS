DROP PACKAGE BODY ASU.PKG_R_INCOMEVITIAZ
/

--
-- PKG_R_INCOMEVITIAZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_INCOMEVITIAZ" 
 is-- Created by TimurLan
  FUNCTION DO_CALC_REPORT(pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER) RETURN NUMBER
   IS-- Used in rIncomeVitiaz.dpr
    CURSOR c (pDATA1 DATE, pDATA2 DATE)
     IS
      SELECT /*+ rule*/fc_fam, fc_im, fc_otch, get_pacvid (TKARTA.FK_KOD2) FC_VID, GET_PACFROMTO (TKARTA.FK_ID) FC_FROMTO,
             TO_CHAR (FD_ROJD, 'dd.mm.yyyy') FD_ROJD, GET_PACVOZR (TKARTA.FK_ID) FN_VOZR,
             GET_SKK (TKARTA.FK_ID) FC_SKK, FC_PUT, GET_IB (TKARTA.FK_ID) FK_IB, FC_RABOTA
        FROM TKARTA, TSROKY
       WHERE TSROKY.FK_PACID = TKARTA.FK_ID
         AND TSROKY.FD_DATA1 BETWEEN pData1 AND pData2+1-1/(24*60*60)
         AND TSROKY.FK_PRYB = 2;
    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (32767);
  BEGIN
    PROGRESS_BAR.Setmaxvalue(4);
    PROGRESS_BAR.SETSTROUT ('���������� ������...');
    PROGRESS_BAR.STEPIT;
    INSERT INTO TCLOBS (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB INTO nC, cC;
    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str := PKG_HTML.GET_HEAD('excel','������ ��������� � ��������� "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', '�� ��������') ||'" �� ������ � ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy'),
                             null,null,null,
                             null,null,null,
                             null,null,null,
                             null,null,'landscape',
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<BODY>' ||
      '<P ALIGN="CENTER"><B>������ ��������� � ��������� "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', '�� ��������') ||'"</B><BR>'||
      '�� ������ � ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') ||
      '<BR>(��������� �������)</P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<table>'||
      '<tr>'||
      '<TD>� �/�:</td>'||
      '<TD colspan=3>�.�.�.:</td>'||
      '<TD>��������� �����������:</td>'||
      '<TD>����� �������:</td>'||
      '<TD>���� ��������:</td>'||
      '<TD>���������� ���������:</td>'||
      '<TD>���������� �����:</td>'||
      '<TD>� �������:</td>'||
      '<TD>� �.�.:</td>'||
      '<TD>����� ������:</td>'||
      '</tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('������ ��������� �������...');
    PROGRESS_BAR.STEPIT;
    FOR p IN c (pFD_DATA1, pFD_DATA2) LOOP
      str  :=
        '<TR><TD>' || c%ROWCOUNT || '</TD>'||
        '<TD class=user>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_FAM) || '</TD>'||
        '<TD class=user>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_IM) || '</TD>'||
        '<TD class=user>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_OTCH) || '</TD>'||
        '<TD class=user>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_VID) || '</TD>'||
        '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_FROMTO) || '</TD>'||
        '<TD>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FD_ROJD) || '</TD><TD>';
      IF p.FN_VOZR < 5 THEN
        str := str||'������ 5';
      ELSIF p.FN_VOZR < 12 THEN
        str := str||'������ 12';
      ELSIF p.FN_VOZR > 60 THEN
        str := str||'������ 60';
      ELSE
        str := str||'&nbsp;';
      END IF;
      str := str||'</TD><TD>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_SKK) || '</TD>'||
                  '<TD style=''mso-number-format:"\@";text-align:right;''>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_PUT) || '</TD>'||
                  '<TD style=''mso-number-format:"\@";''>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FK_IB) || '</TD>'||-- I mat' ego tak...
                  '<TD class=user>' || PKG_R_ALLFUNC.RETURN_VALUE(p.FC_RABOTA) || '</TD></TR>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    PROGRESS_BAR.SETSTROUT ('������� ����������...');
    PROGRESS_BAR.STEPIT;
    str  := '</TABLE>'||
            '<P ALIGN="CENTER"><B>���������� ���������� ��������� �������</B><BR>�� ������ � ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') || ' �� ' || TO_CHAR (pFD_DATA1, 'dd.mm.yyyy')||'</P>'||
            '<table>'||
            '<TR><TD>&nbsp;</TD>'||
            '<TD>�����:</TD>'||
            '<TD>�������:</TD>'||
            '<TD>������ 60:</TD>'||
            '<TD>���� (�� 12):</TD>'||
            '<TD>������ 5:</TD></TR>'||
            '<TR><TD>�����:</TD>'||
            '<TD>' || PKG_R_ALLFUNC.GET_COUNT_INC (pFD_DATA1, pFD_DATA2) || '</TD>'||
            '<TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_VOZR (pFD_DATA1,pFD_DATA2,12,1) ||'</TD>'||
            '<TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_VOZR (pFD_DATA1, pFD_DATA2, 60, 1) ||'</TD>'||
            '<TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_VOZR (pFD_DATA1, pFD_DATA2, 12, 0) ||'</TD>'||
            '<TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_VOZR (pFD_DATA1, pFD_DATA2, 5, 0) ||'</TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<TR><TD>� ���. ���.:</TD><TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_SKK (pFD_DATA1, pFD_DATA2, 1) || '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 12, 1, 1) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 60, 1, 1) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 12, 0, 1) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 5, 0, 1) ||
        '</TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str  :=
      '<TR ALIGN="CENTER"><TD>��� ���. ���.:</TD><TD>' || PKG_R_ALLFUNC.GET_COUNT_INC_SKK (pFD_DATA1, pFD_DATA2, 0) || '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 12, 1, 0) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 60, 1, 0) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 12, 0, 0) ||
        '</TD><TD>' ||
        PKG_R_ALLFUNC.GET_COUNT_INC_VOZR_SKK (pFD_DATA1, pFD_DATA2, 5, 0, 0) ||
        '</TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    PROGRESS_BAR.SETSTROUT ('��� ����� ������...');
    PROGRESS_BAR.STEPIT;
    str  := '</TABLE><BR><P><B>����� ��������: _________________________ ' || DO_VRACHFIO (pFK_VRACHID) || '</B></body></html>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;
end PKG_R_INCOMEVITIAZ;
/

SHOW ERRORS;


