DROP PACKAGE ASU.PKG_UTL_SQL
/

--
-- PKG_UTL_SQL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_UTL_SQL" 
  IS
--


  FUNCTION add_text_predicat (s_where IN VARCHAR2, s_predicat IN VARCHAR2, s_text IN VARCHAR)
   RETURN VARCHAR2;
END; -- Package spec
/

SHOW ERRORS;


