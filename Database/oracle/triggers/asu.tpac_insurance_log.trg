DROP TRIGGER ASU.TPAC_INSURANCE_LOG
/

--
-- TPAC_INSURANCE_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPAC_INSURANCE (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPAC_INSURANCE_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPAC_INSURANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_PacID), :new.fk_id);
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_INSURDOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_insurdocid), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_PacID), null, :old.fk_id);
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_INSURDOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_insurdocid), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    if UPDATING ('fk_insurdocid') AND PKG_LOG.GET_VALUE(:old.fk_insurdocid) <> PKG_LOG.GET_VALUE(:new.fk_insurdocid) then
      PKG_LOG.Do_log('TPAC_INSURANCE', 'FK_INSURDOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_insurdocid), PKG_LOG.GET_VALUE(:new.fk_insurdocid), :old.fk_id);
    end if;
  end if;
  null;
END TPAC_INSURANCE_LOG;
/
SHOW ERRORS;


