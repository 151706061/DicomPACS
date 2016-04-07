DROP TRIGGER ASU.TNAZWIZZARD_SHBN_BEFOR_DEL
/

--
-- TNAZWIZZARD_SHBN_BEFOR_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZWIZZARD_NAZ (Table)
--   TNAZWIZZARD_SHBN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_SHBN_BEFOR_DEL" 
 BEFORE
  DELETE
 ON tnazwizzard_shbn
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from tnazwizzard_naz where fk_shablonid=:old.fk_id;
end;
/
SHOW ERRORS;


