DROP TABLE ASU.TTOWN CASCADE CONSTRAINTS
/

--
-- TTOWN  (Table) 
--
CREATE TABLE ASU.TTOWN
(
  FK_ID       NUMBER(15),
  FC_NAME     VARCHAR2(30 BYTE),
  FL_DEFAULT  NUMBER(1)                         DEFAULT 0,
  FK_GUID     VARCHAR2(32 BYTE)                 DEFAULT sys_guid()
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TTOWN IS 'Справочник "Города" by TimurLan '
/

COMMENT ON COLUMN ASU.TTOWN.FK_ID IS 'SEQUENCE=[SEQ_TTOWN]'
/

COMMENT ON COLUMN ASU.TTOWN.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TTOWN.FL_DEFAULT IS 'знач. по-умолчанию'
/


--
-- IDX_TTOWN_GUID  (Index) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TTOWN_GUID ON ASU.TTOWN
(FK_GUID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IDX_TTOWN_SYNC  (Index) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE INDEX ASU.IDX_TTOWN_SYNC ON ASU.TTOWN
(FC_NAME)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTOWN_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE UNIQUE INDEX ASU.TTOWN_BY_FK_ID ON ASU.TTOWN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTOWN_LOG  (Trigger) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTOWN_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TTOWN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TTOWN', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TTOWN', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TTOWN', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TTOWN', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TTOWN', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TTOWN', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TTOWN_LOG;
/
SHOW ERRORS;


--
-- TTOWN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTOWN_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TTOWN   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT SEQ_TTOWN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TR_TTOWN  (Trigger) 
--
--  Dependencies: 
--   TTOWN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TTOWN" 
     AFTER INSERT OR UPDATE OR DELETE ON ttown FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
    
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         
         insert into ttown_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
              values (0,:new.FC_NAME,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
       elsif DELETING then
         insert into ttown_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         
         insert into ttown_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
              values (2,:new.FC_NAME,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
   exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
   end;
/
SHOW ERRORS;


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TTOWN TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TTOWN TO EXCH43
/

