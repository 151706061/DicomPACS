DROP FUNCTION ASU.GET_COUNT_PACID
/

--
-- GET_COUNT_PACID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_PACID" (pFK_SMIDID IN BINARY_INTEGER)
  RETURN BINARY_INTEGER IS
  -- by TimurLan
  Result BINARY_INTEGER;
  CURSOR c is
    SELECT COUNT(DISTINCT(VNAZ.FK_PACID))
      FROM TIB, VNAZ
     WHERE TIB.FK_SMID = pFK_SMIDID AND VNAZ.FK_ID = TIB.FK_PACID;
BEGIN
  open c;
  fetch c into Result;
  close c;
  if Result = 0 then Result := null;
  end if;
  RETURN(Result);
END;
/

SHOW ERRORS;


