DROP FUNCTION ASU.GET_SMIDNAME_BIO
/

--
-- GET_SMIDNAME_BIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_ANALBIOHIM (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDNAME_BIO" (pSMID IN NUMBER) return varchar2 is
  Result varchar2(4000);
  pSmidID NUMBER;
  CURSOR c2 IS SELECT FK_OWNER FROM TSMID WHERE FK_ID = pSMID;
BEGIN
  OPEN c2;
  FETCH c2 INTO pSmidID;
  CLOSE c2;

  IF pSmidID = GET_ANALBIOHIM THEN
    RETURN 'Общая биохимия';
  END IF;

  FOR C IN (SELECT fc_name FROM tsmid WHERE fk_id=pSMID) LOOP
   result :=C.fc_name;
  END LOOP;
  return(Result);
end GET_SMIDNAME_BIO;
/

SHOW ERRORS;


