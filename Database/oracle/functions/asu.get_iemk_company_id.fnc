DROP FUNCTION ASU.GET_IEMK_COMPANY_ID
/

--
-- GET_IEMK_COMPANY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_IEMK_COMPANY_ID RETURN NUMBER
IS
--���������� ID ������ ��� "��������" ���� � ���������� ����������� (������� exch43.texchange_company)
BEGIN
   RETURN 162; --ID ������ ��� "��������" ���� � ���������� ����������� (������� exch43.texchange_company)
END;
/

SHOW ERRORS;


