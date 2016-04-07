DROP PACKAGE ASU.PKG_ANONYMIZE
/

--
-- PKG_ANONYMIZE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_ANONYMIZE" IS

  -- Author  : SPASSKIY
  -- Created : 06.10.2009 15:41:07
  -- Purpose : ������������� ������������ ������

  -- ������������ �������� - ������� ������������ ������ ��� ��������
  PROCEDURE DO_ANONYMIZE(PPEOPLEID IN NUMBER, PSOTRID IN NUMBER);
  -- ���������� ��� ������������ ��������
  FUNCTION GET_PEOPLE_FIO(PPEOPLEID NUMBER) RETURN VARCHAR2;
  -- ���������� ���� �������� ������������ ��������
  FUNCTION GET_PEOPLE_BIRTH(pPeopleID NUMBER) RETURN DATE;

END PKG_ANONYMIZE;
/

SHOW ERRORS;


