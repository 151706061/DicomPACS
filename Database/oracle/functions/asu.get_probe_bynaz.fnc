DROP FUNCTION ASU.GET_PROBE_BYNAZ
/

--
-- GET_PROBE_BYNAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABREG (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PROBE_BYNAZ" (pFK_NAZID IN BINARY_INTEGER)
  RETURN BINARY_INTEGER IS
  -- Created by TimurLan
  CURSOR c IS
    SELECT /*+ first_rows*/FN_PROBE FROM TLABREG WHERE FK_NAZID = pFK_NAZID;
  Result BINARY_INTEGER;
BEGIN
  open c;
  fetch c
    into Result;
  close c;
  return Result;
END;
/

SHOW ERRORS;


