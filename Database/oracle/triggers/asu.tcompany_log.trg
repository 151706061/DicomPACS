DROP TRIGGER ASU.TCOMPANY_LOG
/

--
-- TCOMPANY_LOG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TCOMPANY (Table)
--   PKG_LOG (Package)
--
CREATE OR REPLACE TRIGGER ASU."TCOMPANY_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON asu.TCOMPANY
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
--DECLARE
--  nTemp NUMBER;
BEGIN
  if INSERTING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'INSERT',
                       null,
                       asu.PKG_LOG.GET_VALUE(:new.fk_id),
                       :new.fk_id);
  elsif DELETING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'DELETE',
                       asu.PKG_LOG.GET_VALUE(:old.fk_id),
                       null,
                       :old.fk_id);
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FC_NAME',
                       'DELETE',
                       asu.PKG_LOG.GET_VALUE(:old.FC_NAME),
                       null,
                       :old.fk_id);
  elsif UPDATING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'UPDATE',
                       asu.PKG_LOG.GET_VALUE(:old.fk_id),
                       asu.PKG_LOG.GET_VALUE(:new.fk_id),
                       :old.fk_id);
    if UPDATING('FC_NAME') AND asu.PKG_LOG.GET_VALUE(:old.FC_NAME) <>
       asu.PKG_LOG.GET_VALUE(:new.FC_NAME) then
      asu.PKG_LOG.Do_log('TCOMPANY',
                         'FC_NAME',
                         'UPDATE',
                         asu.PKG_LOG.GET_VALUE(:old.FC_NAME),
                         asu.PKG_LOG.GET_VALUE(:new.FC_NAME),
                         :old.fk_id);
    end if;
    -- Begin Added 10091015 by Linnikov
    if asu.PKG_LOG.GET_VALUE(:old.FK_OWNER) <>
       asu.PKG_LOG.GET_VALUE(:new.FK_OWNER) then
      asu.PKG_LOG.Do_log('TCOMPANY',
                         'FK_OWNER',
                         'UPDATE',
                         asu.PKG_LOG.GET_VALUE(:old.FK_OWNER),
                         asu.PKG_LOG.GET_VALUE(:new.FK_OWNER),
                         :old.fk_id);
    end if;
    -- End Added 10091015 by Linnikov
    null;
  end if;
END;
/
SHOW ERRORS;


