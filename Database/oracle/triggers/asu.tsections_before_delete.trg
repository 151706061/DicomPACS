DROP TRIGGER ASU.TSECTIONS_BEFORE_DELETE
/

--
-- TSECTIONS_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSECTIONS (Table)
--   TSECTION_BUTLINE (Table)
--   TSECTION_RIGHTS (Table)
--   TSECTION_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSECTIONS_BEFORE_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TSECTIONS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  delete from tsection_smid where fk_secid=:old.fk_id;
  delete from tsection_butline where fk_secid=:old.fk_id;
  delete from tsection_rights where fk_secid=:old.fk_id;
end;
/
SHOW ERRORS;


