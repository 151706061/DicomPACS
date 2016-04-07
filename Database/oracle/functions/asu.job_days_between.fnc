DROP FUNCTION ASU.JOB_DAYS_BETWEEN
/

--
-- JOB_DAYS_BETWEEN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."JOB_DAYS_BETWEEN" return integer is -- Created by TimurLan for some job for deleting from TLOG
  Result integer;
begin
  Result:=(LAST_DAY(TRUNC(SYSDATE)) + 1) - ADD_MONTHS((LAST_DAY(TRUNC(SYSDATE)) + 1),-1);
  return(Result);
end JOB_DAYS_BETWEEN;
/

SHOW ERRORS;


