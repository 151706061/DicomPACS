DROP TRIGGER ASU.TPROFP_LIST_BEFORE_DELETE
/

--
-- TPROFP_LIST_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPROFP_LIST (Table)
--   TPROFP_LIST_NAZ (Table)
--   TIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPROFP_LIST_BEFORE_DELETE" 
 BEFORE
  DELETE
 ON tprofp_list
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from tprofp_list_naz where fk_listid=:old.fk_id;
  delete from tib where fk_pacid=:old.fk_id;
end;
/
SHOW ERRORS;


