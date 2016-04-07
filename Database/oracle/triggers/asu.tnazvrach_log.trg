DROP TRIGGER ASU.TNAZVRACH_LOG
/

--
-- TNAZVRACH_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   PKG_LOG (Package)
--   TNAZVRACH_OLD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZVRACH_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TNAZVRACH_OLD  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TNAZVRACH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_SMID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_smid), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_SOTRID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_sotrid), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_KABINETID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_kabinetid), null, :old.fk_id);
  end if;
  null;
END TNAZVRACH_LOG;
/
SHOW ERRORS;


