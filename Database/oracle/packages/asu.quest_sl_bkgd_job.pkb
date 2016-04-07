DROP PACKAGE BODY ASU.QUEST_SL_BKGD_JOB
/

--
-- QUEST_SL_BKGD_JOB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."QUEST_SL_BKGD_JOB" is
  Procedure submit(what varCHAR2, p_collector varCHAR2, interval varCHAR2 ,
   p_start date, job OUT number ) as  p_job number;
BEGIN

  job := p_job;
  commit;
EXCEPTION
  WHEN OTHERS THEN
    quest_sl_errors_pkg.report_err(p_collector, 'SQLAB_JOB.SUBMIT('||p_collector||')',SQLCODE);
RAISE;
END;
procedure remove(job# number,p_col varCHAR2) is
BEGIN

  commit;
EXCEPTION
  WHEN OTHERS THEN
    quest_sl_errors_pkg.report_err(p_col, 'SQLAB_JOB.REMOVE)'||p_col||')',SQLCODE);
 RAISE;
END;
Procedure broken(job# number, broken boolean, next_date date) is
BEGIN

  commit;
EXCEPTION
   WHEN OTHERS THEN
    quest_sl_errors_pkg.report_err('', 'SQLAB_JOB.broken('||to_CHAR(job#)||')',SQLCODE);
RAISE;
END;
END quest_sl_bkgd_job;
/

SHOW ERRORS;


