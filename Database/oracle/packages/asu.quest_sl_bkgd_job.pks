DROP PACKAGE ASU.QUEST_SL_BKGD_JOB
/

--
-- QUEST_SL_BKGD_JOB  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."QUEST_SL_BKGD_JOB" is
  Procedure submit(what varCHAR2 ,p_collector varCHAR2, interval varCHAR2 ,
    p_start date, job OUT number );
  Procedure remove(job# number,p_col varCHAR2);
  Procedure broken(job# number, broken boolean, next_date date);
end;
/

SHOW ERRORS;


