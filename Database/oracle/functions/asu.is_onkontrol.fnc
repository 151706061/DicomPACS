DROP FUNCTION ASU.IS_ONKONTROL
/

--
-- IS_ONKONTROL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_ONKONTROL" (pFK_PACID in BINARY_INTEGER)
  return BINARY_INTEGER is
  -- by TimurLan
  Result BINARY_INTEGER;
  CURSOR c IS
    SELECT FL_KONTROL FROM TKARTA WHERE FK_ID = pFK_PACID;
BEGIN
  open c;
  fetch c into Result;
  close c;
  return Result;
END;
/

SHOW ERRORS;


