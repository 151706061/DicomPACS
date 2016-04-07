DROP PACKAGE ASU.GET_ZAGR_PALAT
/

--
-- GET_ZAGR_PALAT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."GET_ZAGR_PALAT" IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below
	 tipid NUMBER;
function get_zagr_palat (data1 in date,data2 in date,vrach_id in number,tip_id in number) return number;
END; -- Package spec
/

SHOW ERRORS;


