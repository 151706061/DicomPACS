ALTER TABLE ASU.TCOMPANY_DOLGNOST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCOMPANY_DOLGNOST CASCADE CONSTRAINTS
/

--
-- TCOMPANY_DOLGNOST  (Table) 
--
CREATE TABLE ASU.TCOMPANY_DOLGNOST
(
  FK_ID    NUMBER(15)                           NOT NULL,
  FC_NAME  VARCHAR2(250 BYTE),
  FK_GUID  VARCHAR2(32 BYTE)                    DEFAULT sys_guid(),
  FN_KOD   NUMBER
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

COMMENT ON TABLE ASU.TCOMPANY_DOLGNOST IS 'Справочник "Должность" by TimurLan '
/

COMMENT ON COLUMN ASU.TCOMPANY_DOLGNOST.FK_ID IS 'SEQUENCE=[SEQ_TCOMPANY_DOLGNOST]'
/

COMMENT ON COLUMN ASU.TCOMPANY_DOLGNOST.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TCOMPANY_DOLGNOST.FN_KOD IS 'Код должности'
/


--
-- IDX_TCOMPANY_DOLGNOST_GUID  (Index) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TCOMPANY_DOLGNOST_GUID ON ASU.TCOMPANY_DOLGNOST
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
-- IDX_TCOMPANY_DOLGNOST_SYNC  (Index) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE INDEX ASU.IDX_TCOMPANY_DOLGNOST_SYNC ON ASU.TCOMPANY_DOLGNOST
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
-- TCOMPANYDOLGNOST_PRIMA_KEY  (Index) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE UNIQUE INDEX ASU.TCOMPANYDOLGNOST_PRIMA_KEY ON ASU.TCOMPANY_DOLGNOST
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
-- TR_TCOMPANY_DOLGNOST  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY_DOLGNOST" 
     AFTER INSERT OR UPDATE OR DELETE ON tcompany_dolgnost FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
    
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         
         insert into tcompany_dolgnost_s (FK_ID,FK_GUID,FC_NAME,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_NAME,systimestamp);
       elsif DELETING then
         insert into tcompany_dolgnost_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         
         insert into tcompany_dolgnost_s (FK_ID,FK_GUID,FC_NAME,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_NAME,systimestamp);
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
-- TCOMPANY_DOLG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOMPANY_DOLG_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TCOMPANY_DOLGNOST REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TCOMPANY_DOLGNOST.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TCOMPANY_DOLGNOST_LOG  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOMPANY_DOLGNOST_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TCOMPANY_DOLGNOST  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TCOMPANY_DOLGNOST', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TCOMPANY_DOLGNOST_LOG;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TCOMPANY_DOLGNOST 
-- 
ALTER TABLE ASU.TCOMPANY_DOLGNOST ADD (
  CONSTRAINT TCOMPANYDOLGNOST_PRIMA_KEY
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

