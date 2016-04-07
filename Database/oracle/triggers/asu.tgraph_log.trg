DROP TRIGGER ASU.TGRAPH_LOG
/

--
-- TGRAPH_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TGRAPH (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_LOG" 
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON ASU.TGRAPH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_raspid), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FL_SEX', 'DELETE', PKG_LOG.GET_VALUE(:old.FL_SEX), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FT_HOUR', 'DELETE', PKG_LOG.GET_VALUE(:old.FT_HOUR), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FT_MIN', 'DELETE', PKG_LOG.GET_VALUE(:old.FT_MIN), null, :old.fk_id);        
  elsif UPDATING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);

    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FK_RASPID) <> PKG_LOG.GET_VALUE(:new.FK_RASPID) then
      PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_RASPID), PKG_LOG.GET_VALUE(:new.FK_RASPID), :old.fk_id);
    end if;

    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FD_DATE) <> PKG_LOG.GET_VALUE(:new.FD_DATE) then
      PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATE), PKG_LOG.GET_VALUE(:new.FD_DATE), :old.fk_id);
    end if;
    
    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FL_SEX) <> PKG_LOG.GET_VALUE(:new.FL_SEX) then
      PKG_LOG.Do_log('TGRAPH', 'FL_SEX', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_SEX), PKG_LOG.GET_VALUE(:new.FL_SEX), :old.fk_id);
    end if;
  end if;
END;


/*CREATE OR REPLACE TRIGGER "TGRAPH_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON TGRAPH
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_raspid), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
  end if;
  null;
END TGRAPH_LOG;*/
/
SHOW ERRORS;


