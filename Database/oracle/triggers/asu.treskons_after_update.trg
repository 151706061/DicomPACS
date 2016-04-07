DROP TRIGGER ASU.TRESKONS_AFTER_UPDATE
/

--
-- TRESKONS_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESKONS (Table)
--   VRES (Table)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_AFTER_UPDATE" 
AFTER  UPDATE  ON ASU.TRESKONS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;

  UPDATE vres
     SET fk_id = :new.fk_id,
         FK_SMID = :new.FK_SMID,
         FD_INS = :new.FD_INS,
         FC_RES = :new.FC_RES,
         FK_BLOBID = :new.FK_BLOBID,
         FN_RES = :new.FN_RES,
         FC_TYPE = :new.FC_TYPE,
         FK_VRACHID = :new.FK_VRACHID,
         FK_PACID = :new.FK_PACID,
         FK_NAZID = :new.FK_NAZID,
         FK_PATID = :new.FK_PATID,
         FC_COMENT = :new.FC_COMENT,
         FK_SOS = :new.FK_SOS,
         FL_ZAKL = NULL,
         FL_PATFIRST = :new.FL_PATFIRST
   WHERE fk_id = :old.FK_ID;

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
/
SHOW ERRORS;


