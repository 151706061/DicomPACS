DROP PACKAGE ASU.PKG_ZAGR_PALAT
/

--
-- PKG_ZAGR_PALAT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_ZAGR_PALAT" 
  IS
function GET_ZAGR_PALAT (data1 in date,data2 in date,vrach_id in number,tip in varchar2)
return number;

END; -- Package Specification PKG_ZAGR_PALAT
/

SHOW ERRORS;


