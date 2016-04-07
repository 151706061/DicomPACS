DROP TRIGGER ASU.TRESKONS_DELETE
/

--
-- TRESKONS_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESKONS (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_DELETE" 
AFTER  DELETE  ON ASU.TRESKONS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;

  DELETE
    FROM vres
   WHERE fk_id = :old.fk_id;

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
/
SHOW ERRORS;


