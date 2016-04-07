DROP TRIGGER ASU.TINSURANCE_LOG
/

--
-- TINSURANCE_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TINSURANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURANCE_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TINSURANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TINSURANCE', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TINSURANCE', 'FK_PEPLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_peplid), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TINSURANCE', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURANCE', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_peplid), null, :old.fk_id);
  end if;
  null;
END TINSURANCE_LOG;
/
SHOW ERRORS;


