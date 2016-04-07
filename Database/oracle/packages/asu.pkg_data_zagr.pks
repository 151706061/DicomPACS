DROP PACKAGE ASU.PKG_DATA_ZAGR
/

--
-- PKG_DATA_ZAGR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_DATA_ZAGR" 
  IS
function GET_data_zagr (data in date,vrach_id in number,tip in varchar2)
return number;
END; -- Package Specification PKG_DATA_ZAGR
/

SHOW ERRORS;


