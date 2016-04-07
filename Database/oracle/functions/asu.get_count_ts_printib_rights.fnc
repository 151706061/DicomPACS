DROP FUNCTION ASU.GET_COUNT_TS_PRINTIB_RIGHTS
/

--
-- GET_COUNT_TS_PRINTIB_RIGHTS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TS_PRINTIB_RIGHTS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_TS_PRINTIB_RIGHTS" (PSOTRID    IN NUMBER,
                                                       PPRINTIBID IN NUMBER)
  RETURN NUMBER IS
  Result NUMBER;
  CURSOR c IS
    SELECT COUNT(*)
      FROM TS_PRINTIB_RIGHTS
     WHERE TS_PRINTIB_RIGHTS.FK_SOTRID = pSotrID AND
           TS_PRINTIB_RIGHTS.FK_PRINTIBID = pPrintIBID;
begin
  open c;
  fetch c
    into Result;
  close c;
  return(Result);
end;
/

SHOW ERRORS;


