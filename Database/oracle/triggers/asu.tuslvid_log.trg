DROP TRIGGER ASU.TUSLVID_LOG
/

--
-- TUSLVID_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TUSLVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TUSLVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_NAME), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FL_IB), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCID), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OWNERID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'DELETE', PKG_LOG.GET_VALUE(:old.FL_IB), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCID), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OWNERID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FL_IB') AND PKG_LOG.GET_VALUE(:old.FL_IB) <> PKG_LOG.GET_VALUE(:new.FL_IB) then
      PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_IB), PKG_LOG.GET_VALUE(:new.FL_IB), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCID') AND PKG_LOG.GET_VALUE(:old.FK_DOCID) <> PKG_LOG.GET_VALUE(:new.FK_DOCID) then
      PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCID), PKG_LOG.GET_VALUE(:new.FK_DOCID), :old.fk_id);
    end if;
    if UPDATING ('FK_OWNERID') AND PKG_LOG.GET_VALUE(:old.FK_OWNERID) <> PKG_LOG.GET_VALUE(:new.FK_OWNERID) then
      PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OWNERID), PKG_LOG.GET_VALUE(:new.FK_OWNERID), :old.fk_id);
    end if;
  end if;
  null;
END TUSLVID_LOG;
/
SHOW ERRORS;


