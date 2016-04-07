DROP TRIGGER ASU.TPERESEL_LOG
/

--
-- TPERESEL_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PALATAID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PACID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA1), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA2), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_SROKID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PALATAID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA1), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA2), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_SROKID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_PALATAID') AND PKG_LOG.GET_VALUE(:old.FK_PALATAID) <> PKG_LOG.GET_VALUE(:new.FK_PALATAID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PALATAID), PKG_LOG.GET_VALUE(:new.FK_PALATAID), :old.fk_id);
    end if;
    if UPDATING ('FK_PACID') AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA1') AND PKG_LOG.GET_VALUE(:old.FD_DATA1) <> PKG_LOG.GET_VALUE(:new.FD_DATA1) then
      PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA1), PKG_LOG.GET_VALUE(:new.FD_DATA1), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA2') AND PKG_LOG.GET_VALUE(:old.FD_DATA2) <> PKG_LOG.GET_VALUE(:new.FD_DATA2) then
      PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA2), PKG_LOG.GET_VALUE(:new.FD_DATA2), :old.fk_id);
    end if;
    if UPDATING ('FK_SROKID') AND PKG_LOG.GET_VALUE(:old.FK_SROKID) <> PKG_LOG.GET_VALUE(:new.FK_SROKID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_SROKID), PKG_LOG.GET_VALUE(:new.FK_SROKID), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCOBSLID') AND PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID) <> PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID), PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID), :old.fk_id);
    end if;
  end if;
  null;
END TPERESEL_LOG;
/
SHOW ERRORS;


