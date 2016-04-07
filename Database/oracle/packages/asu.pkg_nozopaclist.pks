DROP PACKAGE ASU.PKG_NOZOPACLIST
/

--
-- PKG_NOZOPACLIST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NOZOPACLIST" IS

  -- ������ ��������� ������� �����
  FUNCTION get_pacforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- ������ ��������� ������� ����� � ����������� ��
  FUNCTION get_doneibforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- ������ ��������� ������� ����� ���������� �������������
  FUNCTION get_vipisforvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;

  -- ������ ��������� c ���������� �������������� �������
  FUNCTION get_paceffectforvrach(pVrachID IN NUMBER, pEffect IN NUMBER, pSort IN NUMBER) RETURN CLOB;

  -- ������ ��������� ������� ������ ����-���������� ������ �����-���� �������
  FUNCTION get_pacwithanydiagofvrach(pVrachID IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- ������ ��������� ������� ������ ����-���������� ������ ������� ������������� ����
  FUNCTION get_pacwithtypeddiagofvrach(pVrachID IN NUMBER, pType IN NUMBER, pSort IN NUMBER) RETURN CLOB;
  -- ������ ���������, ������� �������� �������� ����-����������
  FUNCTION get_pacdiagsofvrach(pVrachID IN NUMBER, pPacID IN NUMBER) RETURN CLOB;
  -- ������ ��������� ������������� ����, ������� �������� �������� ����-����������
  FUNCTION get_pacdiagsofvrachwithtype(pVrachID IN NUMBER, pPacID IN NUMBER, pType IN NUMBER) RETURN CLOB;
END;
/

SHOW ERRORS;


