DROP PACKAGE ASU.PKG_EDNAGRVIT
/

--
-- PKG_EDNAGRVIT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_EDNAGRVIT" 
IS
--
-- Purpose: ����� � �������� �� �� �������� � ����
/*
-------------------------------------------------------------------------------------------------------
|� �.�.| ��������� | ��������� (���.) | ��������� (���.) | ����� ���� | �� ��. | �� 1 ���. | % ������ |
-------------------------------------------------------------------------------------------------------
|      |           |                  |                  |            |        |           |          |
*/
-- Sobjanin A.A. sobjanin_alex@chat.ru
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------

  FUNCTION DoEdNagrVit (pFD1 IN DATE, pFD2 IN DATE)
    RETURN CLOB;
END;-- Package Specification PKG_EDNAGRVIT
/

SHOW ERRORS;


