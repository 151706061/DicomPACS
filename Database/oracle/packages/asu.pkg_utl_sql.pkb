DROP PACKAGE BODY ASU.PKG_UTL_SQL
/

--
-- PKG_UTL_SQL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_UTL_SQL" 
IS

FUNCTION add_text_predicat (s_where IN VARCHAR2, s_predicat IN VARCHAR2, s_text IN VARCHAR)
   RETURN VARCHAR2
IS
BEGIN
   IF s_where is not null
   THEN
      RETURN s_where || chr(10) || ' ' || s_predicat || ' ' || s_text;
   ELSE
      RETURN s_text;
   END IF;
END;



END;
/

SHOW ERRORS;


