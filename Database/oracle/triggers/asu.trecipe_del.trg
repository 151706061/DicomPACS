DROP TRIGGER ASU.TRECIPE_DEL
/

--
-- TRECIPE_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRECIPE (Table)
--   TRECIPE_CHANGE_HISTORY (Table)
--   TRECIPE_MEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DEL" 
 BEFORE 
 DELETE
 ON ASU.TRECIPE  FOR EACH ROW
begin
  delete from ASU.TRECIPE_MEDIC rm where rm.FK_RECIPE_ID = :old.fk_id;
  delete from ASU.TRECIPE_CHANGE_HISTORY rch where rch.FK_RECIPE_ID = :old.fk_id;  
end;
/
SHOW ERRORS;


