DROP FUNCTION ASU.IS_LEAPYEAR
/

--
-- IS_LEAPYEAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."IS_LEAPYEAR" -- Created by TimurLan
  (pFN_YEAR IN NUMBER)
 RETURN NUMBER IS
 nTemp NUMBER;
BEGIN
  if (pFN_YEAR mod 4 = 0) and ((pFN_YEAR mod 100 <> 0) or (pFN_YEAR mod 400 = 0)) then
    nTemp := 1;
  else
    nTemp := 0;
  end if;
  RETURN nTemp;
END;
/

SHOW ERRORS;


