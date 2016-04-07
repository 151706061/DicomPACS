DROP PACKAGE ASU.PKG_AREPORTS
/

--
-- PKG_AREPORTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_AREPORTS" 
IS
--
-- Purpose: ������ � ������
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam       01.01.2001


/*-------------------------------------------------------------------------------------------*\
|               repTreb
\*-------------------------------------------------------------------------------------------*/
--������������ ����������, ���������� ��� ������� � ������� �����
  FUNCTION repSpecTreb (pFK_APRIHID IN NUMBER)
    RETURN NUMBER;

  FUNCTION repAktSpis (pFK_APRIHID IN NUMBER)
    RETURN NUMBER;

  function repMedicOst (pFD in date, pFK_POSTAVID in number)
  return number;
END;   -- Package Specification PKG_AREPORTS
/

SHOW ERRORS;


