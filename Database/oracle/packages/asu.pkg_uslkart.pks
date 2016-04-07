DROP PACKAGE ASU.PKG_USLKART
/

--
-- PKG_USLKART  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_USLKART" 
  IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------      
-- Nefedov S    17.07.2007  Расчет себестоимости услуг
FUNCTION GETSUM_USL_ZATR (pHealID BINARY_INTEGER) RETURN NUMBER;
FUNCTION GETSUM_USL_RENTAB (pHealID BINARY_INTEGER) RETURN NUMBER;

END; -- Package spec
/

SHOW ERRORS;


