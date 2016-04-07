DROP TRIGGER ASU.TADRESS_LOG
/

--
-- TADRESS_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TADRESS (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TADRESS_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TADRESS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TADRESS', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TADRESS', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_pacid), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TADRESS', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TADRESS', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_pacid), null, :old.fk_id);
  end if;
  null;
END TADRESS_LOG;
/
SHOW ERRORS;


