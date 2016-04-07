DROP TRIGGER ASU.TRASPIS_LOG
/

--
-- TRASPIS_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TRASPIS (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TRASPIS_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TRASPIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TRASPIS', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FK_NAZVRACHID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_nazvrachid), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
    PKG_LOG.Do_log('TRASPIS', 'FK_GRAPHID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_graphid), null, :old.fk_id);
  end if;
  null;
END TRASPIS_LOG;
/
SHOW ERRORS;


