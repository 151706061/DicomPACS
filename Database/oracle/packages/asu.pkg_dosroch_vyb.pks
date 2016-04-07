DROP PACKAGE ASU.PKG_DOSROCH_VYB
/

--
-- PKG_DOSROCH_VYB  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DOSROCH_VYB" 
  IS
function GET_DOSROCH_VYB(data1 in date,data2 in date,vrach_id in number)
return number;
END; -- Package Specification PKG_DOSROCH_VYB
/

SHOW ERRORS;


