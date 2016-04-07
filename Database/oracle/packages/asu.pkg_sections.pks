DROP PACKAGE ASU.PKG_SECTIONS
/

--
-- PKG_SECTIONS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SECTIONS" 
  IS
-- for all operations with sections structure
-- by PHP 08.02.2006
--   PROCEDURE GET_( param1 IN datatype DEFAULT default_value,param2 IN OUT datatype);
   FUNCTION GET_BUTTON_ADD_FOR_TIMLIST( pSOTRID IN NUMBER)RETURN NUMBER;
   FUNCTION GET_BUTTON_EDIT_FOR_TIMLIST( pSOTRID IN NUMBER)RETURN NUMBER;
END; -- Package spec
/

SHOW ERRORS;


