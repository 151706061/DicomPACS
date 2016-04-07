DROP PROCEDURE ASU.DO_CHANGE_TS_PRINTIB_RIGHTS
/

--
-- DO_CHANGE_TS_PRINTIB_RIGHTS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TS_PRINTIB_RIGHTS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_CHANGE_TS_PRINTIB_RIGHTS" (pSotrID    IN NUMBER,
                                                        pPrintIBID IN NUMBER) IS
  PRAGMA AUTONOMOUS_TRANSACTION;
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
  if Result = 0 then
    INSERT INTO TS_PRINTIB_RIGHTS
      (FK_SOTRID, FK_PRINTIBID)
    VALUES
      (pSotrID, pPrintIBID);
  else
    DELETE FROM TS_PRINTIB_RIGHTS
     WHERE FK_SOTRID = pSotrID AND FK_PRINTIBID = pPrintIBID;
  end if;
  COMMIT;
end;
/

SHOW ERRORS;


