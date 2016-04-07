DROP TRIGGER ASU.TPEOPLES_LOG
/

--
-- TPEOPLES_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_FAM), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_IM', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_IM), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_OTCH', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_OTCH), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FD_ROJD', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_ROJD), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FK_COMPANYID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_COMPANYID), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TPEOPLES', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
  end if;
END TPEOPLES_LOG;
/
SHOW ERRORS;


