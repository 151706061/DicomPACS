DROP PACKAGE ASU.PKG_MEDVYDTOTAL
/

--
-- PKG_MEDVYDTOTAL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAPR (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDVYDTOTAL" 
IS
--
-- Purpose: Briefly explain the functionality of the package
-- Sobjanin A.A. sobjanin_alex@chat.ru
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below
  TYPE TNaprFK_ID IS TABLE OF tNapr.fk_id%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE TNaprFC_NAME IS TABLE OF tNapr.fc_name%TYPE
    INDEX BY BINARY_INTEGER;
  FUNCTION Do_MedVydTotal (pFD1 IN DATE, pFD2 IN DATE)
    RETURN CLOB;
  PROCEDURE PopulateTempTable (pFD1 IN DATE, pFD2 IN DATE);
  FUNCTION GetKol (pfk_medkartid IN NUMBER, pfk_naprid IN NUMBER)
    RETURN NUMBER;
END;-- Package Specification PKG_MEDVYDTOTAL
/

SHOW ERRORS;


