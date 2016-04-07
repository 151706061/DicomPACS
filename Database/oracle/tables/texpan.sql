DROP TABLE ASU.TEXPAN CASCADE CONSTRAINTS
/

--
-- TEXPAN  (Table) 
--
CREATE TABLE ASU.TEXPAN
(
  FK_ID     NUMBER                              NOT NULL,
  FK_NAZID  NUMBER,
  FK_SMID   NUMBER,
  FK_GUID   VARCHAR2(32 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          53328K
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

COMMENT ON TABLE ASU.TEXPAN IS 'Расширенная информация о анализах. (Вроде уже не используется - Kapusta)'
/

COMMENT ON COLUMN ASU.TEXPAN.FK_ID IS 'SEQUENCE=[SEQ_TEXPAN]'
/

COMMENT ON COLUMN ASU.TEXPAN.FK_NAZID IS 'Код назначения TNAZAN.FK_ID'
/

COMMENT ON COLUMN ASU.TEXPAN.FK_SMID IS 'Код TSMID.FK_ID'
/


--
-- TEXPAN_BY_ID  (Index) 
--
--  Dependencies: 
--   TEXPAN (Table)
--
CREATE UNIQUE INDEX ASU.TEXPAN_BY_ID ON ASU.TEXPAN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          35712K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TEXPAN_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TEXPAN (Table)
--
CREATE INDEX ASU.TEXPAN_BY_NAZID ON ASU.TEXPAN
(FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          38144K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TEXPAN_BY_NAZID_SMID  (Index) 
--
--  Dependencies: 
--   TEXPAN (Table)
--
CREATE UNIQUE INDEX ASU.TEXPAN_BY_NAZID_SMID ON ASU.TEXPAN
(FK_SMID, FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          87168K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TEXPAN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEXPAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEXPAN_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TEXPAN FOR EACH ROW
Begin
  SELECT SEQ_TEXPAN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/  
End;
/
SHOW ERRORS;


--
-- TR_TEXPAN  (Trigger) 
--
--  Dependencies: 
--   TEXPAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TEXPAN" 
     AFTER INSERT OR UPDATE OR DELETE ON texpan FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vvnazfk_nazid varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vvnazfk_nazid from asu.TNAZAN t where t.fk_id = :new.fk_nazid;
         exception when others then
           vvnazfk_nazid := null;
         end;
       
         insert into texpan_s (FK_ID,FK_GUID,FK_SMIDg,fk_nazidg,fd_edittime)
              values (0,:new.FK_GUID,vTSMIDFK_SMID,vvnazfk_nazid,systimestamp);
       elsif DELETING then
         insert into texpan_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vvnazfk_nazid from asu.TNAZAN t where t.fk_id = :new.fk_nazid;
         exception when others then
           vvnazfk_nazid := null;
         end;
       
         insert into texpan_s (FK_ID,FK_GUID,FK_SMIDg,fk_nazidg,fd_edittime)
              values (2,:new.FK_GUID,vTSMIDFK_SMID,vvnazfk_nazid,systimestamp);
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


