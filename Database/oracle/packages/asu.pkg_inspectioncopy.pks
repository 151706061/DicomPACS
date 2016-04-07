DROP PACKAGE ASU.PKG_INSPECTIONCOPY
/

--
-- PKG_INSPECTIONCOPY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_INSPECTIONCOPY" IS
  /* ������ ������ 03.12.2008 ���������� � ���� ������ �������� ��
     TIB.FK_ID (pIBID). �������� ���������� � ����������� �� ���� */
  FUNCTION GET_IBVALUEBYID(pIBID Number) RETURN VARCHAR2;

  /* ������ ������ 03.12.2008 ���������� ��������������� �������� TSMID.FC_NAME
     ��� ���� ����� ����� COMBOBOX �������� ������ �� FK_SMID,
     ��� COMBOBOX �� FK_SMEDITID */
  FUNCTION GET_IBNAMEBYID(pIBID Number) RETURN VARCHAR2;

  /* ������ ������ 03.12.2008
     ��� ���� ����� ����� COMBOBOX ���������� FK_SMID,
     ��� COMBOBOX - FK_SMEDITID */
  FUNCTION GET_IBSMIDIDBYID(pIBID Number) RETURN NUMBER;

  /* ������ ������ 05.12.2008 ���������� 1 ���� ���� ��������� */
  FUNCTION IsTSmidSameType(pTo Number, pFrom Number) RETURN NUMBER;

  /* ������ ������ 28.01.2009 ��������� pSmid �� ��������� ������� T_TMP_INSPECTION_COPY_IN_SMID*/
--  procedure INSERT_TMP_IN_SMID(pSmid Number);

  /* ������ ������ 29.01.2009 ��������� ��������� ������� ����������� ����������� ����� asu.T_TMP_INSPECTION_COPY_RESULT ��� ���� pSmid ���� VARCHAR2*/
--  procedure INSERT_TMP_COPY_RESULT_VC2(pSmid Number, pPeopleID Number);

  /* ������ ������ 30.01.2009 ��������� ��������� ������� ����������� ����������� ����� asu.T_TMP_INSPECTION_COPY_RESULT ��� ����� �� ������� asu.T_TMP_INSPECTION_COPY_IN_SMID ����������� � ����� EDIT, NUMBER, COMBOBOX, DATE*/
--  procedure INSERT_TMP_COPY_RESULT(pPeopleID Number);

  /* ������ ������ 30.01.2009 ��������� �� ��������� ������� ����������� ����������� ����� ��� ����� asu.T_TMP_INSPECTION_COPY_RESULT �� ������� asu.T_TMP_INSPECTION_COPY_IN_SMID */
--  procedure ADD_TMP_COPY_RESULT(pPeopleID Number);

  /* ������ ������ 29.01.2009 ����� ������ (asu.tib.fk_pacid) � �������� ��������� �������� �������
     �� ���� ����� ��������� � ����� pSmidID ���� varchar2 ��� �������� pPeopleID */
  FUNCTION GET_OLDES_VARCHAR2_PACID(pSmid Number, pPeopleID Number) RETURN NUMBER;

  /* ������ ������ 03.02.2009 ���� pValue �� null, �� ����� pValue, ����� pName */
  FUNCTION ValueOrName(pValue Varchar2, pName Varchar2) RETURN Varchar2;
END;
/

SHOW ERRORS;


