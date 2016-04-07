ALTER TABLE ASU.TVIDDOC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVIDDOC CASCADE CONSTRAINTS
/

--
-- TVIDDOC  (Table) 
--
CREATE TABLE ASU.TVIDDOC
(
  FK_ID       NUMBER(16)                        NOT NULL,
  FC_NAME     VARCHAR2(30 BYTE),
  FN_ORDER    NUMBER(2)                         DEFAULT 0,
  FL_DEFAULT  NUMBER                            DEFAULT 0,
  FK_GUID     VARCHAR2(32 BYTE)                 DEFAULT sys_guid()
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          560K
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

COMMENT ON TABLE ASU.TVIDDOC IS 'Справочник видов документов by TimurLan'
/

COMMENT ON COLUMN ASU.TVIDDOC.FK_ID IS 'SEQUENCE=[SEQ_TVIDDOCS]'
/

COMMENT ON COLUMN ASU.TVIDDOC.FC_NAME IS 'название'
/

COMMENT ON COLUMN ASU.TVIDDOC.FN_ORDER IS 'Порядок'
/

COMMENT ON COLUMN ASU.TVIDDOC.FL_DEFAULT IS 'По умолчанию'
/


--
-- IDX_TVIDDOC_GUID  (Index) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TVIDDOC_GUID ON ASU.TVIDDOC
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
-- IDX_TVIDDOC_SYNC  (Index) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE INDEX ASU.IDX_TVIDDOC_SYNC ON ASU.TVIDDOC
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
-- PK_TVIDDOC  (Index) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVIDDOC ON ASU.TVIDDOC
(FK_ID)
NOLOGGING
TABLESPACE INDX
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
-- TVIDDOC_LOG  (Trigger) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVIDDOC_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TVIDDOC  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TVIDDOC', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TVIDDOC', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TVIDDOC', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TVIDDOC', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TVIDDOC', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TVIDDOC', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TVIDDOC_LOG;
/
SHOW ERRORS;


--
-- TVIDDOCS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVIDDOCS_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TVIDDOC REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TVIDDOCS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TR_TVIDDOC  (Trigger) 
--
--  Dependencies: 
--   TVIDDOC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TVIDDOC" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TVIDDOC FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
    
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         
         insert into TVIDDOC_s (FK_ID,FC_NAME,FN_ORDER,FL_DEFAULT,FK_GUID,fd_edittime)
              values (0,:new.FC_NAME,:new.FN_ORDER,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
       elsif DELETING then
         insert into TVIDDOC_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         
         insert into TVIDDOC_s (FK_ID,FC_NAME,FN_ORDER,FL_DEFAULT,FK_GUID,fd_edittime)
              values (2,:new.FC_NAME,:new.FN_ORDER,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
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


-- 
-- Non Foreign Key Constraints for Table TVIDDOC 
-- 
ALTER TABLE ASU.TVIDDOC ADD (
  CONSTRAINT PK_TVIDDOC
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT SELECT ON ASU.TVIDDOC TO EXCH43
/

