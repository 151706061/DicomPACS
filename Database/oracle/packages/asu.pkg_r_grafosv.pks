DROP PACKAGE ASU.PKG_R_GRAFOSV
/

--
-- PKG_R_GRAFOSV  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_R_GRAFOSV" -- Modified by TimurLan
 IS
 function DoFillMe(d1 in date, d2 in date) return varchar2;
 procedure del_table(tName in varchar2);
END;
/

SHOW ERRORS;


