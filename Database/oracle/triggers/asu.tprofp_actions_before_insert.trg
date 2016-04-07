DROP TRIGGER ASU.TPROFP_ACTIONS_BEFORE_INSERT
/

--
-- TPROFP_ACTIONS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPROFP_ACTIONS (Sequence)
--   TPROFP_ACTIONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_ACTIONS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tprofp_actions
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tprofp_actions.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


