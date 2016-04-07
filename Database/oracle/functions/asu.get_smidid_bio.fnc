DROP FUNCTION ASU.GET_SMIDID_BIO
/

--
-- GET_SMIDID_BIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TSMID (Table)
--   GET_ANALBIOHIM (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMIDID_BIO" (id IN NUMBER) RETURN NUMBER IS
    pSmidID NUMBER;
    CURSOR c2 IS select fk_owner from tsmid, tnazan where tnazan.fk_smid = tsmid.fk_id and tnazan.fk_id = id;
BEGIN
  OPEN c2;
  FETCH c2 INTO pSmidID;
  CLOSE c2;

  IF pSmidID = GET_ANALBIOHIM THEN
    RETURN pSmidID;
  END IF;
  RETURN id;
END;
/

SHOW ERRORS;


