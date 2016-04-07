DROP FUNCTION ASU.GET_TYPE_FROM_SMID
/

--
-- GET_TYPE_FROM_SMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_TYPE_FROM_SMID" (pFK_SMID IN BINARY_INTEGER)
  RETURN VARCHAR2 IS
  --
  -- Purpose: ¬Œ«¬–¿Ÿ¿≈“ “»œ »« —Ã»ƒ
  --
  -- Wrote by Philip A. Milovanov
  -- mod by TimurLan
  CURSOR c IS
    SELECT /*+ first_rows*/FC_TYPE FROM TSMID WHERE FK_ID = pFK_SMID;
  s TSMID.FC_TYPE%TYPE;
BEGIN
  open c;
  fetch c into s;
  close c;
  return s;
END;
/

SHOW ERRORS;


