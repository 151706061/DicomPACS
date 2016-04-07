DROP TRIGGER ASU.TPACLST_LOG
/

--
-- TPACLST_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TPACLST (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPACLST_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPACLST  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TPACLST', 'NAZID', 'DELETE', PKG_LOG.GET_VALUE(:old.nazid), null, :old.fk_graphid);
    PKG_LOG.Do_log('TPACLST', 'FK_GRAPHID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_graphid), null, :old.fk_graphid);
    PKG_LOG.Do_log('TPACLST', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_pacid), null, :old.fk_graphid);
  elsif INSERTING then
    PKG_LOG.Do_log('TPACLST', 'NAZID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.nazid), :new.fk_graphid);
    PKG_LOG.Do_log('TPACLST', 'FK_GRAPHID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_graphid), :new.fk_graphid);
    PKG_LOG.Do_log('TPACLST', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_pacid), :new.fk_graphid);
  end if;
  null;
END TPACLST_LOG;
/
SHOW ERRORS;


