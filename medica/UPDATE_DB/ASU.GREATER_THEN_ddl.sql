-- Start of DDL Script for Function ASU.GREATER_THEN
-- Generated 2.04.08 12:23:53 from ASU@ASU

CREATE OR REPLACE 
FUNCTION asu.greater_then
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



-- End of DDL Script for Function ASU.GREATER_THEN

