DROP PACKAGE ASU.GRAFOSV_OLD
/

--
-- GRAFOSV_OLD  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."GRAFOSV_OLD" -- Modified by TimurLan
  IS
function DoFillMe(d1 in date, d2 in date) return varchar2;
procedure del_table(tName in varchar2);
END; -- Package Specification GRAFOSV
/

SHOW ERRORS;


