DROP TRIGGER ASU.TMISEXCH_TASKS_BEFORE_INSERT
/

--
-- TMISEXCH_TASKS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMISEXCH (Sequence)
--   TMISEXCH_TASKS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMISEXCH_TASKS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tmisexch_tasks
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tmisexch.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


