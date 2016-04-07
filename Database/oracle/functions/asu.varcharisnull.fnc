DROP FUNCTION ASU.VARCHARISNULL
/

--
-- VARCHARISNULL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."VARCHARISNULL" (str IN VARCHAR2)
  RETURN NUMBER
IS
  -- Zhukov: не использовать эту функцию!!!!
--  использовать decode(str,null,1,0) 
BEGIN
  IF str IS NULL THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;   -- Function VARCHARISNULL
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.VARCHARISNULL TO LOGIN
/

