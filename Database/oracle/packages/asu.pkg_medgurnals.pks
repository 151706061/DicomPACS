DROP PACKAGE ASU.PKG_MEDGURNALS
/

--
-- PKG_MEDGURNALS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDGURNALS" 
IS
--
-- Purpose: ���� �������:
--      1. ������ �������� (��������� �� ������� ������� �������)
--      2. ������ ������������
--      3. ������ ����� ����������������� � ������� �� ��������
--      4. ������ ������ ������������
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- ������� �.�.
  -- Enter package declarations as shown below
--   ������ �������� (��������� �� ������� ������� �������)
-- ���������� ��� ����� � ������� ����� �����
  FUNCTION DoDefekt (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;
--  ������ ������������
-- ���������� ��� ����� � ������� ����� �����
  FUNCTION DoKOnsZavOtd (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;
--  ������ ����� ����������������� � ������� �� ��������
-- ���������� ��� ����� � ������� ����� �����
  FUNCTION DoProtivPac (FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;

--  ������ ������ ������������ �� ������������ �������� "������������ �������"
  FUNCTION DoMedVyd (FD1 IN DATE, FD2 IN DATE, pFK_APOSTAVSHIKID number)
    RETURN NUMBER;
END;   -- Package Specification PKG_MEDGURNALS
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


