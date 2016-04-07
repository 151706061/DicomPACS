DROP TRIGGER ASU.TSMID_LOG
/

--
-- TSMID_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_ID), :new.fk_id);
    PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OWNER), :new.fk_id);
    PKG_LOG.Do_log('TSMID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_NAME), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
    PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OWNER), null, :old.fk_id);
    PKG_LOG.Do_log('TSMID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSMID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TSMID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FP_PAT') AND PKG_LOG.GET_VALUE(:old.FP_PAT) <> PKG_LOG.GET_VALUE(:new.FP_PAT) then
      PKG_LOG.Do_log('TSMID', 'FP_PAT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_PAT), PKG_LOG.GET_VALUE(:new.FP_PAT), :old.fk_id);
    end if;
    if UPDATING ('FN_ED') AND PKG_LOG.GET_VALUE(:old.FN_ED) <> PKG_LOG.GET_VALUE(:new.FN_ED) then
      PKG_LOG.Do_log('TSMID', 'FN_ED', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_ED), PKG_LOG.GET_VALUE(:new.FN_ED), :old.fk_id);
    end if;
    if UPDATING ('FK_LOINC_CODE') AND PKG_LOG.GET_VALUE(:old.FK_LOINC_CODE) <> PKG_LOG.GET_VALUE(:new.FK_LOINC_CODE) then
      PKG_LOG.Do_log('TSMID', 'FK_LOINC_CODE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_LOINC_CODE), PKG_LOG.GET_VALUE(:new.FK_LOINC_CODE), :old.fk_id);
    end if;
    if UPDATING ('FC_SYNONIM') AND PKG_LOG.GET_VALUE(:old.FC_SYNONIM) <> PKG_LOG.GET_VALUE(:new.FC_SYNONIM) then
      PKG_LOG.Do_log('TSMID', 'FC_SYNONIM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_SYNONIM), PKG_LOG.GET_VALUE(:new.FC_SYNONIM), :old.fk_id);
    end if;
    if UPDATING ('FK_MKB10') AND PKG_LOG.GET_VALUE(:old.FK_MKB10) <> PKG_LOG.GET_VALUE(:new.FK_MKB10) then
      PKG_LOG.Do_log('TSMID', 'FK_MKB10', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_MKB10), PKG_LOG.GET_VALUE(:new.FK_MKB10), :old.fk_id);
    end if;
    if UPDATING ('FK_OWNER') AND PKG_LOG.GET_VALUE(:old.FK_OWNER) <> PKG_LOG.GET_VALUE(:new.FK_OWNER) then
      PKG_LOG.Do_log('TSMID', 'FK_OWNER', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OWNER), PKG_LOG.GET_VALUE(:new.FK_OWNER), :old.fk_id);
    end if;
    if UPDATING ('FC_TYPE') AND PKG_LOG.GET_VALUE(:old.FC_TYPE) <> PKG_LOG.GET_VALUE(:new.FC_TYPE) then
      PKG_LOG.Do_log('TSMID', 'FC_TYPE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_TYPE), PKG_LOG.GET_VALUE(:new.FC_TYPE), :old.fk_id);
    end if;
    if UPDATING ('FP_INOUT') AND PKG_LOG.GET_VALUE(:old.FP_INOUT) <> PKG_LOG.GET_VALUE(:new.FP_INOUT) then
      PKG_LOG.Do_log('TSMID', 'FP_INOUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_INOUT), PKG_LOG.GET_VALUE(:new.FP_INOUT), :old.fk_id);
    end if;
    if UPDATING ('FL_SHOWANAL') AND PKG_LOG.GET_VALUE(:old.FL_SHOWANAL) <> PKG_LOG.GET_VALUE(:new.FL_SHOWANAL) then
      PKG_LOG.Do_log('TSMID', 'FL_SHOWANAL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_SHOWANAL), PKG_LOG.GET_VALUE(:new.FL_SHOWANAL), :old.fk_id);
    end if;
    if UPDATING ('FL_DEL') AND PKG_LOG.GET_VALUE(:old.FL_DEL) <> PKG_LOG.GET_VALUE(:new.FL_DEL) then
      PKG_LOG.Do_log('TSMID', 'FL_DEL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_DEL), PKG_LOG.GET_VALUE(:new.FL_DEL), :old.fk_id);
    end if;
  end if;
  null;
END TSMID_LOG;
/
SHOW ERRORS;


