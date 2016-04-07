DROP TRIGGER ASU.TRECEPT_DEL
/

--
-- TRECEPT_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRECEPT (Table)
--   TRECEPTCON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_DEL" 
BEFORE  DELETE  ON ASU.TRECEPT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  delete from treceptcon where fk_receptid=:old.fk_id;
END;
/
SHOW ERRORS;


