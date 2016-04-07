DROP TRIGGER ASU.TSROKY_LOG
/

--
-- TSROKY_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TSROKY (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSROKY  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PACID), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PRYB), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VYB), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_KOL), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA1), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA2), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA3), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_SUM), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OPLID), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VYBID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PRYB), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VYB), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_KOL), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA1), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA2), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA3), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_SUM), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OPLID), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VYBID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_PACID') /*AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID)*/ then
      PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
    if UPDATING ('FK_PRYB') /*AND PKG_LOG.GET_VALUE(:old.FK_PRYB) <> PKG_LOG.GET_VALUE(:new.FK_PRYB) */then
      PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRYB), PKG_LOG.GET_VALUE(:new.FK_PRYB), :old.fk_id);
    end if;
    if UPDATING ('FN_KOL') AND PKG_LOG.GET_VALUE(:old.FN_KOL) <> PKG_LOG.GET_VALUE(:new.FN_KOL) then
      PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_KOL), PKG_LOG.GET_VALUE(:new.FN_KOL), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA1') /*AND PKG_LOG.GET_VALUE(:old.FD_DATA1) <> PKG_LOG.GET_VALUE(:new.FD_DATA1) */then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA1), PKG_LOG.GET_VALUE(:new.FD_DATA1), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA2') AND PKG_LOG.GET_VALUE(:old.FD_DATA2) <> PKG_LOG.GET_VALUE(:new.FD_DATA2) then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA2), PKG_LOG.GET_VALUE(:new.FD_DATA2), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA3') AND PKG_LOG.GET_VALUE(:old.FD_DATA3) <> PKG_LOG.GET_VALUE(:new.FD_DATA3) then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA3), PKG_LOG.GET_VALUE(:new.FD_DATA3), :old.fk_id);
    end if;
    if UPDATING ('FN_SUM') AND PKG_LOG.GET_VALUE(:old.FN_SUM) <> PKG_LOG.GET_VALUE(:new.FN_SUM) then
      PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_SUM), PKG_LOG.GET_VALUE(:new.FN_SUM), :old.fk_id);
    end if;
    if UPDATING ('FK_OPLID') AND PKG_LOG.GET_VALUE(:old.FK_OPLID) <> PKG_LOG.GET_VALUE(:new.FK_OPLID) then
      PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OPLID), PKG_LOG.GET_VALUE(:new.FK_OPLID), :old.fk_id);
    end if;
    if UPDATING ('FK_VYBID') AND PKG_LOG.GET_VALUE(:old.FK_VYBID) <> PKG_LOG.GET_VALUE(:new.FK_VYBID) then
      PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VYBID), PKG_LOG.GET_VALUE(:new.FK_VYBID), :old.fk_id);
    end if;
  end if;
  null;
END TSROKY_LOG;
/
SHOW ERRORS;


