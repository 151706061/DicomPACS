DROP PACKAGE ASU.PKG_IRT
/

--
-- PKG_IRT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_IRT" 
  IS

  function GetKard(pFK_PACID in number) return number;
END; -- Package Specification PKG_IRT
/

SHOW ERRORS;


