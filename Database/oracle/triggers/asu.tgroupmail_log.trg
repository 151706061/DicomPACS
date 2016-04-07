DROP TRIGGER ASU.TGROUPMAIL_LOG
/

--
-- TGROUPMAIL_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TGROUPMAIL (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TGROUPMAIL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TGROUPMAIL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TGROUPMAIL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TGROUPMAIL', 'FC_MAIL', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_mail), :new.fk_id);
    PKG_LOG.Do_log('TGROUPMAIL', 'FK_GROUPID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_groupid), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TGROUPMAIL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TGROUPMAIL', 'FC_MAIL', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_MAIL), null, :old.fk_id);
    PKG_LOG.Do_log('TGROUPMAIL', 'FK_GROUPID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TGROUPMAIL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_MAIL') AND PKG_LOG.GET_VALUE(:old.FC_MAIL) <> PKG_LOG.GET_VALUE(:new.FC_MAIL) then
      PKG_LOG.Do_log('TGROUPMAIL', 'FC_MAIL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_MAIL), PKG_LOG.GET_VALUE(:new.FC_MAIL), :old.fk_id);
    end if;
    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(:new.FK_GROUPID) then
      PKG_LOG.Do_log('TGROUPMAIL', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
  end if;
  null;
END TGROUPMAIL_LOG;
/
SHOW ERRORS;


