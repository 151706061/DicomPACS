DROP FUNCTION ASU.YEAR
/

--
-- YEAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."YEAR" (Data IN DATE)
  RETURN NUMBER
IS
  res   NUMBER;
BEGIN
  res := TO_NUMBER (TO_CHAR (Data, 'yyyy'));
  RETURN res;
END;   -- Function YEAR
/

SHOW ERRORS;


