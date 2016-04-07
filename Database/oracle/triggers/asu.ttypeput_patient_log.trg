DROP TRIGGER ASU.TTYPEPUT_PATIENT_LOG
/

--
-- TTYPEPUT_PATIENT_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TTYPEPUT_PATIENT (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TTYPEPUT_PATIENT_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TTYPEPUT_PATIENT  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TTIPROOM', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TTIPROOM', 'FC_VID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_vid), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TTIPROOM', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TTIPROOM', 'FC_VID', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_VID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TTIPROOM', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_VID') AND PKG_LOG.GET_VALUE(:old.FC_VID) <> PKG_LOG.GET_VALUE(:new.FC_VID) then
      PKG_LOG.Do_log('TTIPROOM', 'FC_VID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_VID), PKG_LOG.GET_VALUE(:new.FC_VID), :old.fk_id);
    end if;
  end if;
  null;
END TTYPEPUT_PATIENT_LOG;
/
SHOW ERRORS;


