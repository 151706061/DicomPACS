DROP TRIGGER ASU.TPROFP_ACTIONS_BEFOR_DELETE
/

--
-- TPROFP_ACTIONS_BEFOR_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPROFP_ACTIONS (Table)
--   TPROFP_LIST (Table)
--   TPROFP_LIST_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_ACTIONS_BEFOR_DELETE" 
 BEFORE
  DELETE
 ON tprofp_actions
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from tprofp_list where fk_actionid=:old.fk_id;
  delete from tprofp_list_naz where fk_actionid=:old.fk_id;
end;
/
SHOW ERRORS;


