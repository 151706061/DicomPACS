DROP PACKAGE ASU.PKG_NAPR_PAC
/

--
-- PKG_NAPR_PAC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NAPR_PAC" 
  IS
function GET_NAPR_PAC (data1 in date,data2 in date,vrach_id in number)
RETURN NUMBER;
END; -- Package Specification PKG_NAPR_PAC
/

SHOW ERRORS;


