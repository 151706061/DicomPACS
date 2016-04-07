DROP FUNCTION ASU.GET_RUSTYPE
/

--
-- GET_RUSTYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_RUSTYPE" (sType IN VARCHAR2)
  RETURN VARCHAR2
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
--  Sam     27.01.2000 ��������� ���� �������� ����� � �������
-- ---------   ------  -------------------------------------------

BEGIN
  IF sType IS NULL THEN
    RETURN '';
  ELSIF sType IN ('TEXT', 'CLOB') THEN
    RETURN '�����';
  ELSIF sType = 'PICTURE' THEN
    RETURN '�������';
  ELSIF sType = 'VIDEO' THEN
    RETURN '�����';
  ELSE
    raise_application_error (-20002, '���������������� ��� ������');
  END IF;
END;
/

SHOW ERRORS;


