DROP TRIGGER ASU.TNAZIS_DELETE
/

--
-- TNAZIS_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZGROUP (Table)
--   TNAZIS (Table)
--   TIB (Table)
--   TRESIS (Table)
--   TPACLST (Table)
--   TTUBPARAM (Table)
--   DO_CHECK_DELETE_TALON (Procedure)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_DELETE" 
 BEFORE
  DELETE
 ON asu.tnazis
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  DELETE FROM tib WHERE fk_pacid = :old.fk_id;
  DELETE FROM tresis WHERE fk_nazid = :old.fk_id;
  DELETE FROM TNAZGROUP WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TTUBPARAM WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM asu.tpaclst where nazid = :old.fk_id; -- added by Prihodko N. 23.05.2011  

  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
  DELETE FROM vnaz WHERE fk_id = :old.fk_id;
  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
 --   RAISE;
--   BEGIN
--     o_neurosoft_link.prc_delete_files(:old.fk_id);--by TimurLan 4 Kapusta's neurosoft
--     EXCEPTION WHEN OTHERS THEN NULL;
--   END;
END;
/
SHOW ERRORS;


