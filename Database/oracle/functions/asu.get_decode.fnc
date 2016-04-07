DROP FUNCTION ASU.GET_DECODE
/

--
-- GET_DECODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DECODE" (Val IN VARCHAR2, FIRST IN VARCHAR, ValFirst IN VARCHAR2, ValSecond IN VARCHAR2)
  RETURN VARCHAR2
IS
--
-- Purpose: Briefly explain the functionality of the function
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam
  res   varchar2(4000);
BEGIN
  IF val = FIRST THEN
    res := ValFirst;
  ELSE
    res := valSecond;
  END IF;
  RETURN Res;
END;   -- Function GET_DECODE
/

SHOW ERRORS;


