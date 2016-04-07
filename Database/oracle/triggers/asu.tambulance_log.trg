DROP TRIGGER ASU.TAMBULANCE_LOG
/

--
-- TAMBULANCE_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TAMBULANCE (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
--    PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCOBSL), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_peplid), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSL), null, :old.fk_id);
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TAMBULANCE', 'FÑ_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_fam), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_ibid), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBY', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_iby), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    PKG_LOG.Do_log('TAMBULANCE', 'FK_PEPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), PKG_LOG.GET_VALUE(:new.FK_PEPLID), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TAMBULANCE', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
    if UPDATING ('FK_IBID') AND PKG_LOG.GET_VALUE(:old.FK_IBID) <> PKG_LOG.GET_VALUE(:new.FK_IBID) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_ibid), PKG_LOG.GET_VALUE(:new.fk_ibid), :old.fk_id);
    end if;
    if UPDATING ('FK_IBY') AND PKG_LOG.GET_VALUE(:old.FK_IBY) <> PKG_LOG.GET_VALUE(:new.FK_IBY) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBY', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_iby), PKG_LOG.GET_VALUE(:new.fk_iby), :old.fk_id);
    end if;
    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(:new.FK_GROUPID) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_GROUPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
    if UPDATING ('FC_PUT') AND PKG_LOG.GET_VALUE(:old.FC_PUT) <> PKG_LOG.GET_VALUE(:new.FC_PUT) then
      PKG_LOG.Do_log('TAMBULANCE', 'FC_PUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_PUT), PKG_LOG.GET_VALUE(:new.FC_PUT), :old.fk_id);
    end if;
    if UPDATING ('FK_PRIZN') AND PKG_LOG.GET_VALUE(:old.FK_PRIZN) <> PKG_LOG.GET_VALUE(:new.FK_PRIZN) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_PRIZN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRIZN), PKG_LOG.GET_VALUE(:new.FK_PRIZN), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCOBSL') AND PKG_LOG.GET_VALUE(:old.FK_DOCOBSL) <> PKG_LOG.GET_VALUE(:new.FK_DOCOBSL) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSL), PKG_LOG.GET_VALUE(:new.FK_DOCOBSL), :old.fk_id);
    end if;
  end if;
  null;
END TAMBULANCE_LOG;
/
SHOW ERRORS;


