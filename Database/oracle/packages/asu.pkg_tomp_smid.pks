DROP PACKAGE ASU.PKG_TOMP_SMID
/

--
-- PKG_TOMP_SMID  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TOMP_SMID IS
 procedure Calculate(pSmidOwnerID integer, pRazdID integer, pAddSmidNoHeal integer, pAddHealNoSmid integer, pShowDelSmid integer default 0);
END;
/

SHOW ERRORS;


