DROP TRIGGER ASU.TDOCOBSL_LOG
/

--
-- TDOCOBSL_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TDOCOBSL (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TDOCOBSL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TDOCOBSL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VIDDOCID), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_NUMIB), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_YEAR), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VIDDOCID), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_NUMIB), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_YEAR), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_VIDDOCID') AND PKG_LOG.GET_VALUE(:old.FK_VIDDOCID) <> PKG_LOG.GET_VALUE(:new.FK_VIDDOCID) then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VIDDOCID), PKG_LOG.GET_VALUE(:new.FK_VIDDOCID), :old.fk_id);
    end if;
    if UPDATING ('FK_NUMIB') AND PKG_LOG.GET_VALUE(:old.FK_NUMIB) <> PKG_LOG.GET_VALUE(:new.FK_NUMIB) then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_NUMIB), PKG_LOG.GET_VALUE(:new.FK_NUMIB), :old.fk_id);
    end if;
    if UPDATING ('FN_YEAR') AND PKG_LOG.GET_VALUE(:old.FN_YEAR) <> PKG_LOG.GET_VALUE(:new.FN_YEAR) then
      PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_YEAR), PKG_LOG.GET_VALUE(:new.FN_YEAR), :old.fk_id);
    end if;
  end if;
END TDOCOBSL_LOG;
/
SHOW ERRORS;


