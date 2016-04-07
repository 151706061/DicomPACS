DROP TRIGGER ASU.TRESLECH_DELETE
/

--
-- TRESLECH_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESLECH (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_DELETE" 
AFTER DELETE
ON ASU.TRESLECH REFERENCING OLD AS OLD NEW AS NEW
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


