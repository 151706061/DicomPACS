DROP TRIGGER ASU.TSUBVID_LOG
/

--
-- TSUBVID_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TSUBVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSUBVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSUBVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSUBVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TSUBVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
    PKG_LOG.Do_log('TSUBVID', 'FK_VIDID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VIDID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSUBVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TSUBVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
    PKG_LOG.Do_log('TSUBVID', 'FK_VIDID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VIDID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSUBVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TSUBVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FK_VIDID') AND PKG_LOG.GET_VALUE(:old.FK_VIDID) <> PKG_LOG.GET_VALUE(:new.FK_VIDID) then
      PKG_LOG.Do_log('TSUBVID', 'FK_VIDID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VIDID), PKG_LOG.GET_VALUE(:new.FK_VIDID), :old.fk_id);
    end if;
  end if;
  null;
END TSUBVID_LOG;
/
SHOW ERRORS;


