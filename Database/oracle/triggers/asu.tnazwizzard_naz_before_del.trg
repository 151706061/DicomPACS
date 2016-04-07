DROP TRIGGER ASU.TNAZWIZZARD_NAZ_BEFORE_DEL
/

--
-- TNAZWIZZARD_NAZ_BEFORE_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TNAZWIZZARD_EXPAN (Table)
--   TNAZWIZZARD_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_NAZ_BEFORE_DEL" 
 BEFORE
  DELETE
 ON tnazwizzard_naz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
--  delete from tnazwizzard_tib where fk_shbn_nazid=:old.fk_id;
  delete from tib where fk_pacid=:old.fk_id;
  delete from asu.tnazwizzard_expan e where e.fk_nazwizzardnazid=:old.fk_id;
end;
/
SHOW ERRORS;


