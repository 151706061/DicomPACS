ALTER TABLE ASU.TFUS_SMID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TFUS_SMID CASCADE CONSTRAINTS
/

--
-- TFUS_SMID  (Table) 
--
CREATE TABLE ASU.TFUS_SMID
(
  FK_ID       NUMBER,
  FC_NAME     VARCHAR2(250 BYTE),
  FC_SYNONIM  VARCHAR2(250 BYTE),
  FK_GUID     VARCHAR2(32 BYTE)                 DEFAULT sys_guid(),
  FK_OWNER    NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN ASU.TFUS_SMID.FK_ID IS 'SEQUENCE=[SEQ_TFUS_SMID]'
/

COMMENT ON COLUMN ASU.TFUS_SMID.FK_OWNER IS 'TFUS_SMID.FK_ID'
/


--
-- PK_TFUS_SMID  (Index) 
--
--  Dependencies: 
--   TFUS_SMID (Table)
--
CREATE UNIQUE INDEX ASU.PK_TFUS_SMID ON ASU.TFUS_SMID
(FK_ID)
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
-- TFUS_SMID_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TFUS_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFUS_SMID_BEFORE_INS" 
 BEFORE
 INSERT
 ON ASU.TFUS_SMID  FOR EACH ROW
BEGIN
 SELECT SEQ_TFUS_SMID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


--
-- TR_TFUS_SMID  (Trigger) 
--
--  Dependencies: 
--   TFUS_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_SMID" 
     AFTER INSERT OR UPDATE OR DELETE ON tfus_smid FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_OWNER varchar(32);

   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
           vTSMIDFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER, 'tfus_smid');
         exception when others then
           vTSMIDFK_OWNER := null;
         end;

         insert into tfus_smid_s (FK_ID,FC_NAME,FC_SYNONIM,FK_GUID,FK_OWNERg,fd_edittime)
              values (0,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_GUID,vTSMIDFK_OWNER,systimestamp);
       elsif DELETING then
         insert into tfus_smid_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
           vTSMIDFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER, 'tfus_smid');
         exception when others then
           vTSMIDFK_OWNER := null;
         end;

         insert into tfus_smid_s (FK_ID,FC_NAME,FC_SYNONIM,FK_GUID,FK_OWNERg,fd_edittime)
              values (2,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_GUID,vTSMIDFK_OWNER,systimestamp);
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
-- Non Foreign Key Constraints for Table TFUS_SMID 
-- 
ALTER TABLE ASU.TFUS_SMID ADD (
  CONSTRAINT PK_TFUS_SMID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

