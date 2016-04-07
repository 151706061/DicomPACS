DROP TRIGGER ASU.TKARTA_LOG
/

--
-- TKARTA_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TKARTA  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TKARTA', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TKARTA', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_peplid), null, :old.fk_id);
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TKARTA', 'FÑ_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_fam), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_IBID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_ibid), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_IBY', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_iby), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TKARTA', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    PKG_LOG.Do_log('TKARTA', 'FK_PEPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), PKG_LOG.GET_VALUE(:new.FK_PEPLID), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TKARTA', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
    if UPDATING ('FK_IBID') AND PKG_LOG.GET_VALUE(:old.FK_IBID) <> PKG_LOG.GET_VALUE(:new.FK_IBID) then
      PKG_LOG.Do_log('TKARTA', 'FK_IBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_ibid), PKG_LOG.GET_VALUE(:new.fk_ibid), :old.fk_id);
    end if;
    if UPDATING ('FK_IBY') AND PKG_LOG.GET_VALUE(:old.FK_IBY) <> PKG_LOG.GET_VALUE(:new.FK_IBY) then
      PKG_LOG.Do_log('TKARTA', 'FK_IBY', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_iby), PKG_LOG.GET_VALUE(:new.fk_iby), :old.fk_id);
    end if;
    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(:new.FK_GROUPID) then
      PKG_LOG.Do_log('TKARTA', 'FK_GROUPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
    if UPDATING ('FC_PUT') AND PKG_LOG.GET_VALUE(:old.FC_PUT) <> PKG_LOG.GET_VALUE(:new.FC_PUT) then
      PKG_LOG.Do_log('TKARTA', 'FC_PUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_PUT), PKG_LOG.GET_VALUE(:new.FC_PUT), :old.fk_id);
    end if;
    if UPDATING ('FK_KOD') AND PKG_LOG.GET_VALUE(:old.FK_KOD) <> PKG_LOG.GET_VALUE(:new.FK_KOD) then
      PKG_LOG.Do_log('TKARTA', 'FK_KOD', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_KOD), PKG_LOG.GET_VALUE(:new.FK_KOD), :old.fk_id);
    end if;
    if UPDATING ('FK_KOD2') AND PKG_LOG.GET_VALUE(:old.FK_KOD2) <> PKG_LOG.GET_VALUE(:new.FK_KOD2) then
      PKG_LOG.Do_log('TKARTA', 'FK_KOD2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_KOD2), PKG_LOG.GET_VALUE(:new.FK_KOD2), :old.fk_id);
    end if;
    if UPDATING ('FP_TEK_COC') AND PKG_LOG.GET_VALUE(nvl(:old.FP_TEK_COC,0)) <> PKG_LOG.GET_VALUE(nvl(:new.FP_TEK_COC,0)) then
      PKG_LOG.Do_log('TKARTA', 'FP_TEK_COC', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_TEK_COC), PKG_LOG.GET_VALUE(:new.FP_TEK_COC), :old.fk_id);
    end if;
    if UPDATING ('FK_PRIZN') AND PKG_LOG.GET_VALUE(:old.FK_PRIZN) <> PKG_LOG.GET_VALUE(:new.FK_PRIZN) then
      PKG_LOG.Do_log('TKARTA', 'FK_PRIZN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRIZN), PKG_LOG.GET_VALUE(:new.FK_PRIZN), :old.fk_id);
    end if;
    if UPDATING ('FN_SUM') AND PKG_LOG.GET_VALUE(:old.FN_SUM) <> PKG_LOG.GET_VALUE(:new.FN_SUM) then
      PKG_LOG.Do_log('TKARTA', 'FN_SUM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_SUM), PKG_LOG.GET_VALUE(:new.FN_SUM), :old.fk_id);
    end if;
    if UPDATING ('FK_PUTTYPE') AND PKG_LOG.GET_VALUE(:old.FK_PUTTYPE) <> PKG_LOG.GET_VALUE(:new.FK_PUTTYPE) then
      PKG_LOG.Do_log('TKARTA', 'FK_PUTTYPE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PUTTYPE), PKG_LOG.GET_VALUE(:new.FK_PUTTYPE), :old.fk_id);
    end if;
    if UPDATING ('FK_PACVID') AND PKG_LOG.GET_VALUE(:old.FK_PACVID) <> PKG_LOG.GET_VALUE(:new.FK_PACVID) then
      PKG_LOG.Do_log('TKARTA', 'FK_PACVID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACVID), PKG_LOG.GET_VALUE(:new.FK_PACVID), :old.fk_id);
    end if;
    if UPDATING ('FL_PAYPLACE') AND PKG_LOG.GET_VALUE(:old.FL_PAYPLACE) <> PKG_LOG.GET_VALUE(:new.FL_PAYPLACE) then
      PKG_LOG.Do_log('TKARTA', 'FL_PAYPLACE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_PAYPLACE), PKG_LOG.GET_VALUE(:new.FL_PAYPLACE), :old.fk_id);
    end if;
  end if;
  null;
END TKARTA_LOG;
/
SHOW ERRORS;


