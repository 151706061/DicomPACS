DROP TRIGGER ASU.TKORP_LOG
/

--
-- TKORP_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TKORP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKORP_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TKORP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TKORP', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TKORP', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TKORP', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
    PKG_LOG.Do_log('TKORP', 'FN_FLOOR', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_FLOOR), null, :old.fk_id);
    PKG_LOG.Do_log('TKORP', 'FK_STOLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_STOLID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TKORP', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TKORP', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FN_FLOOR') AND PKG_LOG.GET_VALUE(:old.FN_FLOOR) <> PKG_LOG.GET_VALUE(:new.FN_FLOOR) then
      PKG_LOG.Do_log('TKORP', 'FN_FLOOR', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_FLOOR), PKG_LOG.GET_VALUE(:new.FN_FLOOR), :old.fk_id);
    end if;
    if UPDATING ('FK_STOLID') AND PKG_LOG.GET_VALUE(:old.FK_STOLID) <> PKG_LOG.GET_VALUE(:new.FK_STOLID) then
      PKG_LOG.Do_log('TKORP', 'FK_STOLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_STOLID), PKG_LOG.GET_VALUE(:new.FK_STOLID), :old.fk_id);
    end if;
  end if;
  null;
END TKORP_LOG;
/
SHOW ERRORS;


