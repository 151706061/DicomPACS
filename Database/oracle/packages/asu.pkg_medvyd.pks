DROP PACKAGE ASU.PKG_MEDVYD
/

--
-- PKG_MEDVYD  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDVYD" 
IS
--
-- Purpose: Briefly explain the functionality of the package
-- Sobjanin A.A. sobjanin_alex@chat.ru
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below
  FUNCTION is_existsmedicbyreceptvid (pFK_MEDICID IN NUMBER)
    RETURN NUMBER;
  FUNCTION is_existsmedicbyrecvidfarmgr (pFK_MEDICID IN NUMBER)
    RETURN NUMBER;
  FUNCTION is_existsmedicfarmgr (pFK_MEDICID IN NUMBER)
    RETURN NUMBER;
  PROCEDURE PopulateTables;
  PROCEDURE SelectMedic;
  FUNCTION DoMedVyd (FD1 IN DATE, FD2 IN DATE)
    RETURN CLOB;
  FUNCTION GetParamList
    RETURN CLOB;
END;-- Package Specification PKG_MEDVYD
/

SHOW ERRORS;


