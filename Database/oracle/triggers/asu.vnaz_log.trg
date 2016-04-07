DROP TRIGGER ASU.VNAZ_LOG
/

--
-- VNAZ_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_ID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_SMID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_SMID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FD_NAZ', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_NAZ), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FD_RUN', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_RUN), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_ROOMID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ROOMID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_ISPOLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ISPOLID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_VRACHID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_NAZSOSID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_NAZSOSID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);

  elsif UPDATING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);

    if UPDATING ('FK_SMID') AND PKG_LOG.GET_VALUE(:old.FK_SMID) <> PKG_LOG.GET_VALUE(:new.FK_SMID) then
      PKG_LOG.Do_log('VNAZ', 'FK_SMID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_SMID), PKG_LOG.GET_VALUE(:new.FK_SMID), :old.fk_id);
    end if;

    if UPDATING ('FD_NAZ') AND PKG_LOG.GET_VALUE(:old.FD_NAZ) <> PKG_LOG.GET_VALUE(:new.FD_NAZ) then
      PKG_LOG.Do_log('VNAZ', 'FD_NAZ', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_NAZ), PKG_LOG.GET_VALUE(:new.FD_NAZ), :old.fk_id);
    end if;

    if UPDATING ('FD_RUN') AND PKG_LOG.GET_VALUE(:old.FD_RUN) <> PKG_LOG.GET_VALUE(:new.FD_RUN) then
      PKG_LOG.Do_log('VNAZ', 'FD_RUN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_RUN), PKG_LOG.GET_VALUE(:new.FD_RUN), :old.fk_id);
    end if;

    if UPDATING ('FK_ROOMID') AND PKG_LOG.GET_VALUE(:old.FK_ROOMID) <> PKG_LOG.GET_VALUE(:new.FK_ROOMID) then
      PKG_LOG.Do_log('VNAZ', 'FK_ROOMID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ROOMID), PKG_LOG.GET_VALUE(:new.FK_ROOMID), :old.fk_id);
    end if;

    if UPDATING ('FK_ISPOLID') AND PKG_LOG.GET_VALUE(:old.FK_ISPOLID) <> PKG_LOG.GET_VALUE(:new.FK_ISPOLID) then
      PKG_LOG.Do_log('VNAZ', 'FK_ISPOLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ISPOLID), PKG_LOG.GET_VALUE(:new.FK_ISPOLID), :old.fk_id);
    end if;

    if UPDATING ('FK_VRACHID') AND PKG_LOG.GET_VALUE(:old.FK_VRACHID) <> PKG_LOG.GET_VALUE(:new.FK_VRACHID) then
      PKG_LOG.Do_log('VNAZ', 'FK_VRACHID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), PKG_LOG.GET_VALUE(:new.FK_VRACHID), :old.fk_id);
    end if;

    if UPDATING ('FK_NAZSOSID') AND PKG_LOG.GET_VALUE(:old.FK_NAZSOSID) <> PKG_LOG.GET_VALUE(:new.FK_NAZSOSID) then
      PKG_LOG.Do_log('VNAZ', 'FK_NAZSOSID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_NAZSOSID), PKG_LOG.GET_VALUE(:new.FK_NAZSOSID), :old.fk_id);
    end if;

    if UPDATING ('FK_PACID') AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID) then
      PKG_LOG.Do_log('VNAZ', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
  end if;
  null;
END VNAZ_LOG;
/
SHOW ERRORS;


