DROP TABLE ASU.TREGION CASCADE CONSTRAINTS
/

--
-- TREGION  (Table) 
--
CREATE TABLE ASU.TREGION
(
  FK_ID       NUMBER(15)                        NOT NULL,
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

COMMENT ON TABLE ASU.TREGION IS 'Справочник "Регионы" by TimurLan '
/

COMMENT ON COLUMN ASU.TREGION.FK_ID IS 'SEQUENCE=[SEQ_TREGION]'
/

COMMENT ON COLUMN ASU.TREGION.FC_NAME IS 'назвние'
/

COMMENT ON COLUMN ASU.TREGION.FL_DEFAULT IS 'знач. по-умолчанию'
/


--
-- IDX_TREGION_GUID  (Index) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TREGION_GUID ON ASU.TREGION
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
-- IDX_TREGION_SYNC  (Index) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE INDEX ASU.IDX_TREGION_SYNC ON ASU.TREGION
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
-- TREGION_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE UNIQUE INDEX ASU.TREGION_BY_FK_ID ON ASU.TREGION
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TREGION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREGION_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TREGION   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT SEQ_TREGION.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TREGION_LOG  (Trigger) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREGION_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TREGION  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TREGION', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TREGION', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TREGION', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TREGION', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TREGION', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TREGION', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TREGION_LOG;
/
SHOW ERRORS;


--
-- TR_TREGION  (Trigger) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TREGION" 
     AFTER INSERT OR UPDATE OR DELETE ON tregion FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
    
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         
         insert into tregion_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
              values (0,:new.FC_NAME,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
       elsif DELETING then
         insert into tregion_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         
         insert into tregion_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
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


DROP SYNONYM BUH.TREGION
/

--
-- TREGION  (Synonym) 
--
--  Dependencies: 
--   TREGION (Table)
--
CREATE SYNONYM BUH.TREGION FOR ASU.TREGION
/


