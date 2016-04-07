DROP FUNCTION ASU.GET_ED_FROM_SMID
/

--
-- GET_ED_FROM_SMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ED_FROM_SMID" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
CURSOR c IS SELECT /*+rule*/FN_ED FROM TSMID WHERE FK_ID=pFK_ID;
i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END; -- Function GET_ED_FROM_SMID
/

SHOW ERRORS;

