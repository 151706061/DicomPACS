DROP TABLE ASU.TDOCOBSL CASCADE CONSTRAINTS
/

--
-- TDOCOBSL  (Table) 
--
CREATE TABLE ASU.TDOCOBSL
(
  FK_ID        NUMBER                           NOT NULL,
  FK_VIDDOCID  NUMBER,
  FK_NUMIB     NUMBER(9),
  FN_YEAR      NUMBER(4),
  FK_LPU       NUMBER,
  FK_GUID      VARCHAR2(32 BYTE)                DEFAULT sys_guid()
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          6912K
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

COMMENT ON COLUMN ASU.TDOCOBSL.FK_ID IS 'SEQUENCE=[SEQ_TDOCOBSL]'
/

COMMENT ON COLUMN ASU.TDOCOBSL.FK_VIDDOCID IS 'Ссылка на tuslvid - вид док-та обслуживания'
/

COMMENT ON COLUMN ASU.TDOCOBSL.FK_NUMIB IS 'Уникальный номер док-та'
/

COMMENT ON COLUMN ASU.TDOCOBSL.FN_YEAR IS 'Год документа'
/

COMMENT ON COLUMN ASU.TDOCOBSL.FK_LPU IS 'TCOMPANY.FK_ID'
/


--
-- IDX_TDOCOBSL_GUID  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE INDEX ASU.IDX_TDOCOBSL_GUID ON ASU.TDOCOBSL
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
-- TDOCOBSL_BY_ID  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE UNIQUE INDEX ASU.TDOCOBSL_BY_ID ON ASU.TDOCOBSL
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDOCOBSL_BY_ID_VIDDOC  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE UNIQUE INDEX ASU.TDOCOBSL_BY_ID_VIDDOC ON ASU.TDOCOBSL
(FK_ID, FK_VIDDOCID)
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
-- TDOCOBSL_BY_VIDDOC_NUMDOC  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE INDEX ASU.TDOCOBSL_BY_VIDDOC_NUMDOC ON ASU.TDOCOBSL
(FK_VIDDOCID, FK_NUMIB)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          10336K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDOCOBSL$FK_VIDDOCID  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE INDEX ASU.TDOCOBSL$FK_VIDDOCID ON ASU.TDOCOBSL
(FK_VIDDOCID)
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
-- TDOCOBSL$FN_YEAR  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE INDEX ASU.TDOCOBSL$FN_YEAR ON ASU.TDOCOBSL
(FN_YEAR)
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
-- TDOCOBSL_NUMDOC_YEAR  (Index) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE INDEX ASU.TDOCOBSL_NUMDOC_YEAR ON ASU.TDOCOBSL
(FK_NUMIB, FN_YEAR)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          9M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDOCOBSL_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDOCOBSL_BEFORE_INS" 
 BEFORE
 INSERT
 ON ASU.TDOCOBSL  REFERENCING OLD AS old NEW AS new
 FOR EACH ROW
Begin
  SELECT SEQ_TDOCOBSL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  if :New.fk_lpu is null then
    :New.fk_lpu:= asu.get_current_lpu;
  end if;    
End;
/
SHOW ERRORS;


--
-- TDOCOBSL_LOG  (Trigger) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDOCOBSL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TDOCOBSL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VIDDOCID), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_NUMIB), :new.fk_id);
    PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_YEAR), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VIDDOCID), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_NUMIB), null, :old.fk_id);
      PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_YEAR), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TDOCOBSL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_VIDDOCID') AND PKG_LOG.GET_VALUE(:old.FK_VIDDOCID) <> PKG_LOG.GET_VALUE(:new.FK_VIDDOCID) then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_VIDDOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VIDDOCID), PKG_LOG.GET_VALUE(:new.FK_VIDDOCID), :old.fk_id);
    end if;
    if UPDATING ('FK_NUMIB') AND PKG_LOG.GET_VALUE(:old.FK_NUMIB) <> PKG_LOG.GET_VALUE(:new.FK_NUMIB) then
      PKG_LOG.Do_log('TDOCOBSL', 'FK_NUMIB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_NUMIB), PKG_LOG.GET_VALUE(:new.FK_NUMIB), :old.fk_id);
    end if;
    if UPDATING ('FN_YEAR') AND PKG_LOG.GET_VALUE(:old.FN_YEAR) <> PKG_LOG.GET_VALUE(:new.FN_YEAR) then
      PKG_LOG.Do_log('TDOCOBSL', 'FN_YEAR', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_YEAR), PKG_LOG.GET_VALUE(:new.FN_YEAR), :old.fk_id);
    end if;
  end if;
END TDOCOBSL_LOG;
/
SHOW ERRORS;


--
-- TR_TDOCOBSL  (Trigger) 
--
--  Dependencies: 
--   TDOCOBSL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TDOCOBSL" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TDOCOBSL FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTUSLVIDfk_viddocid varchar(32);
     vTCOMPANYfk_lpu varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
     begin
       select s.fk_id into vID from  
                           (select fk_id from TUSLVID t
                             start with t.fk_id = 481
                           connect by prior t.fk_id = t.fk_ownerid) s
                       where nvl(:new.fk_viddocid,:old.fk_viddocid)=s.fk_id;
     exception when others then vID := null;
     end;
     if vID is not null then     
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_id = :new.fk_viddocid;
         exception when others then
           vTUSLVIDfk_viddocid := null;
         end;
        begin
          select t.fk_guid into  vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_id = :new.fk_lpu;
         exception when others then
           vTCOMPANYfk_lpu := null;
         end;
       
         insert into TDOCOBSL_s (FK_ID,FK_NUMIB,FN_YEAR,FK_GUID,fk_viddocidg,fk_lpug,fd_edittime)
              values (0,:new.FK_NUMIB,:new.FN_YEAR,:new.FK_GUID,vTUSLVIDfk_viddocid,vTCOMPANYfk_lpu,systimestamp);
       elsif DELETING then
         insert into TDOCOBSL_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_id = :new.fk_viddocid;
         exception when others then
           vTUSLVIDfk_viddocid := null;
         end;
        begin
          select t.fk_guid into  vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_id = :new.fk_lpu;
         exception when others then
           vTCOMPANYfk_lpu := null;
         end;
       
         insert into TDOCOBSL_s (FK_ID,FK_NUMIB,FN_YEAR,FK_GUID,fk_viddocidg,fk_lpug,fd_edittime)
              values (2,:new.FK_NUMIB,:new.FN_YEAR,:new.FK_GUID,vTUSLVIDfk_viddocid,vTCOMPANYfk_lpu,systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
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


GRANT SELECT ON ASU.TDOCOBSL TO EXCH43
/

