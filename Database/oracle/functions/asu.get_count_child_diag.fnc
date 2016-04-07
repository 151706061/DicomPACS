DROP FUNCTION ASU.GET_COUNT_CHILD_DIAG
/

--
-- GET_COUNT_CHILD_DIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_COUNT_CHILD_DIAG(pSMID IN NUMBER)
  RETURN NUMBER IS
  nCnt NUMBER;
  CURSOR cCnt is select count(*)
                   from asu.tsmid
                  where fk_owner = pSMID;
BEGIN
  open cCnt;
  fetch cCnt into nCnt;
  close cCnt;
  RETURN nCnt;
END;
/

SHOW ERRORS;


