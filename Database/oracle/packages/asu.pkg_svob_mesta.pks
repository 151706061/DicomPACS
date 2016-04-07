DROP PACKAGE ASU.PKG_SVOB_MESTA
/

--
-- PKG_SVOB_MESTA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SVOB_MESTA" 
  IS
  function get_svob_mesta(data1 in date,data2 in date,vrach_id in number)
return number;
END; -- Package Specification PKG_SVOB_MESTA
/

SHOW ERRORS;


