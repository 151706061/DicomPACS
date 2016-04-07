DROP TRIGGER ASU.TAMBTALON_UPD_FN_SOS
/

--
-- TAMBTALON_UPD_FN_SOS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TRSF (Table)
--   TRSF_SAVED_REESTR (Table)
--
CREATE OR REPLACE TRIGGER ASU.TAMBTALON_UPD_FN_SOS
 AFTER
  UPDATE OF fn_sos
 ON ASU.TAMBTALON REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (:OLD.fn_sos = 1) AND (:NEW.fn_sos = 0) THEN
    UPDATE asu.trsf SET FD_CANCEL_PODPIS_AMBTALON = SYSDATE,
                        FK_SOTR_CANCEL_PODPIS_AMBTALON = :NEW.FK_CANCELPODSOTRID
     WHERE fk_id IN (select t.fk_rsfid from asu.trsf_saved_reestr t, asu.tambtalon_naz tn WHERE t.fk_nazid = tn.fk_nazid AND tn.fk_talonid = :old.fk_id);
  END IF;
End;
/
SHOW ERRORS;


