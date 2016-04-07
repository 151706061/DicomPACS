DROP FUNCTION ASU.NATALIE
/

--
-- NATALIE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."NATALIE" (nValue IN NUMBER, nZnach IN NUMBER) -- Created by TimurLan
  RETURN NUMBER
IS
 nTemp NUMBER;
BEGIN
  IF nValue IS NOT NULL THEN
    nTemp := nZnach;
  ELSE
    nTemp := NULL;
  END IF;
  RETURN nTemp;
END;
/

SHOW ERRORS;


