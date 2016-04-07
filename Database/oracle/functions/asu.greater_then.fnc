DROP FUNCTION ASU.GREATER_THEN
/

--
-- GREATER_THEN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GREATER_THEN" 
  ( param1 IN NUMBER, 
    param2 IN NUMBER)
  RETURN  NUMBER IS
BEGIN 
  IF NVL(param1,0) > NVL(param2,0) then
    return 1;
  else
    return 0;
  end if;  
END;
/

SHOW ERRORS;


