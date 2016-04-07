DROP FUNCTION ASU.POS
/

--
-- POS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."POS" 
  ( str1 IN VARCHAR2,str2 IN VARCHAR2)
  RETURN NUMBER IS
BEGIN
  RETURN INSTR(str2,str1,1,1);
END; -- Function POS
/

SHOW ERRORS;


