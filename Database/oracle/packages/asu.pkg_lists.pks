DROP PACKAGE ASU.PKG_LISTS
/

--
-- PKG_LISTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_LISTS" is

  -- Author  : TIMURLAN
  -- Created : 03.02.2006 9:58:34

  FUNCTION GET_PAC_VRACHPO(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ��� ������ �� �� ���� (�/�������)
  FUNCTION GET_PAC_SOST(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
    -- ���������� ������� ��������� �� ����
  FUNCTION GET_PAC_SOST_DATE(pPACID IN BINARY_INTEGER, pDate in  date) RETURN NUMBER;
   -- ��������� �������� �� ����(������� + ����.����)
  FUNCTION GET_PAC_KONTROL(pFK_PACID IN BINARY_INTEGER) RETURN BINARY_INTEGER;
  -- ���������� 1 ���� � ���������� ��� 0 ���� �� ��������
  FUNCTION GET_PAC_REANIM_OTD(pFK_PACID IN BINARY_INTEGER, pSotrID IN BINARY_INTEGER) RETURN BINARY_INTEGER; -- Created Nefedov 09.02.07
  -- ���������� ���� � �������������� ��������� �������� ����������

  FUNCTION GET_PAC_REJIM(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ����� �� ���� (�/�������)
  FUNCTION GET_PAC_DIETA(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ����� �� ���� (�/�������)

  FUNCTION GET_PAC_SESTR(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ����������� ���������� �� ���������
  FUNCTION GET_PAC_SESTRKRATN(pFK_PACID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ��������� ���������� �� ���������  (�/�������)
  FUNCTION GET_NAZ_PATH(pFK_NAZID IN BINARY_INTEGER) RETURN VARCHAR2;
  -- ���������� ���� �������� �� ���������

  FUNCTION GET_DIAG_MAIN(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  -- ���������� �������� ������� �� ��������
  FUNCTION GET_DIAG_CLINIK(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --���������� ������� ������� �� ��������
  FUNCTION GET_DIAG_ANATOM(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --���������� �������-��������������������� ������� �� ��������
  FUNCTION GET_DIAG_NAPR(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --���������� ������� ������������ ���������� �� ��������
  FUNCTION GET_DIAG_PRIPOSTUP(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --���������� ������� ��� ����������� �� ��������
  --���������� ������� ������ � ��������������
  FUNCTION GET_PAC_GOSPOTKAZ(pFK_PACID IN NUMBER) RETURN VARCHAR2;
  --���������� �������� ��������
  FUNCTION GET_OPER_NAME(pNazID NUMBER) RETURN VARCHAR;
  --���������� ���� �������������� ���������
  FUNCTION GET_LAST_OSM(pNazid NUMBER) RETURN DATE;
end PKG_LISTS;
/

SHOW ERRORS;


