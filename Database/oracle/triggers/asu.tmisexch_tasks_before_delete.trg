DROP TRIGGER ASU.TMISEXCH_TASKS_BEFORE_DELETE
/

--
-- TMISEXCH_TASKS_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMISEXCH_TASKS (Table)
--   TMISEXCH_TASKS_USERS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMISEXCH_TASKS_BEFORE_DELETE" 
 BEFORE
  DELETE
 ON tmisexch_tasks
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from tmisexch_tasks_users where fk_taskid=:old.fk_id;
end;
/
SHOW ERRORS;


