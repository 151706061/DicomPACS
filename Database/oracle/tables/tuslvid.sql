DROP TABLE ASU.TUSLVID CASCADE CONSTRAINTS
/

--
-- TUSLVID  (Table) 
--
CREATE TABLE ASU.TUSLVID
(
  FK_ID          NUMBER(9)                      DEFAULT -1,
  FC_NAME        VARCHAR2(32 BYTE),
  FL_IB          NUMBER(2)                      DEFAULT 1,
  FL_PUT         NUMBER(1)                      DEFAULT 1,
  FL_PUTTYPE     NUMBER(1)                      DEFAULT 1,
  FL_RASS        NUMBER(1)                      DEFAULT 1,
  FL_DEFAULT     NUMBER(1)                      DEFAULT 0,
  FL_STOL        NUMBER(1)                      DEFAULT 1,
  FC_SHORT       VARCHAR2(10 BYTE),
  FK_DOCID       NUMBER,
  FK_BUHTYPEPUT  NUMBER,
  FK_OWNERID     INTEGER,
  FK_GUID        VARCHAR2(32 BYTE)              DEFAULT sys_guid()
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

COMMENT ON TABLE ASU.TUSLVID IS 'Виды предоставляемых услуг '
/

COMMENT ON COLUMN ASU.TUSLVID.FK_ID IS 'SEQUENCE=[SEQ_TUSLVID]'
/

COMMENT ON COLUMN ASU.TUSLVID.FC_NAME IS 'Наименование'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_IB IS 'Указывать №Истории болезни'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_PUT IS 'Указывать №Путевки'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_PUTTYPE IS 'Указывать тип путевки'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_RASS IS 'Оформлять расселение'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_DEFAULT IS 'Значение по умолчанию??'
/

COMMENT ON COLUMN ASU.TUSLVID.FL_STOL IS 'С питанием (закрепление столовых)'
/

COMMENT ON COLUMN ASU.TUSLVID.FC_SHORT IS 'Краткое наименование'
/

COMMENT ON COLUMN ASU.TUSLVID.FK_DOCID IS 'Код документа из TSMID (синоним = VID_DOC) также соответствует tkarta.fk_docid'
/

COMMENT ON COLUMN ASU.TUSLVID.FK_BUHTYPEPUT IS 'Код FK_ID из справочника BUH.TS_TYPEPUT'
/

COMMENT ON COLUMN ASU.TUSLVID.FK_OWNERID IS 'Ссылка на родителя FK_ID'
/


--
-- IDX_TUSLVID_GUID  (Index) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE INDEX ASU.IDX_TUSLVID_GUID ON ASU.TUSLVID
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
-- TR_TUSLVID  (Trigger) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TUSLVID" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TUSLVID FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTUSLVIDfk_ownerid varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_id = :new.fk_ownerid;
         exception when others then
           vTUSLVIDfk_ownerid := null;
         end;
       
         insert into TUSLVID_s (FK_ID,FC_NAME,FL_IB,FL_PUT,FL_PUTTYPE,FL_RASS,FL_DEFAULT,FL_STOL,FC_SHORT,FK_DOCID,FK_BUHTYPEPUT,FK_GUID,fk_owneridg,fd_edittime)
              values (0,:new.FC_NAME,:new.FL_IB,:new.FL_PUT,:new.FL_PUTTYPE,:new.FL_RASS,:new.FL_DEFAULT,:new.FL_STOL,:new.FC_SHORT,:new.FK_DOCID,:new.FK_BUHTYPEPUT,:new.FK_GUID,vTUSLVIDfk_ownerid,systimestamp);
       elsif DELETING then
         insert into TUSLVID_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_id = :new.fk_ownerid;
         exception when others then
           vTUSLVIDfk_ownerid := null;
         end;
       
         insert into TUSLVID_s (FK_ID,FC_NAME,FL_IB,FL_PUT,FL_PUTTYPE,FL_RASS,FL_DEFAULT,FL_STOL,FC_SHORT,FK_DOCID,FK_BUHTYPEPUT,FK_GUID,fk_owneridg,fd_edittime)
              values (2,:new.FC_NAME,:new.FL_IB,:new.FL_PUT,:new.FL_PUTTYPE,:new.FL_RASS,:new.FL_DEFAULT,:new.FL_STOL,:new.FC_SHORT,:new.FK_DOCID,:new.FK_BUHTYPEPUT,:new.FK_GUID,vTUSLVIDfk_ownerid,systimestamp);
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
-- TUSLVID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLVID_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TUSLVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TUSLVID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TUSLVID_LOG  (Trigger) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TUSLVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_NAME), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FL_IB), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCID), :new.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OWNERID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'DELETE', PKG_LOG.GET_VALUE(:old.FL_IB), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCID), null, :old.fk_id);
    PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OWNERID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TUSLVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TUSLVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FL_IB') AND PKG_LOG.GET_VALUE(:old.FL_IB) <> PKG_LOG.GET_VALUE(:new.FL_IB) then
      PKG_LOG.Do_log('TUSLVID', 'FL_IB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_IB), PKG_LOG.GET_VALUE(:new.FL_IB), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCID') AND PKG_LOG.GET_VALUE(:old.FK_DOCID) <> PKG_LOG.GET_VALUE(:new.FK_DOCID) then
      PKG_LOG.Do_log('TUSLVID', 'FK_DOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCID), PKG_LOG.GET_VALUE(:new.FK_DOCID), :old.fk_id);
    end if;
    if UPDATING ('FK_OWNERID') AND PKG_LOG.GET_VALUE(:old.FK_OWNERID) <> PKG_LOG.GET_VALUE(:new.FK_OWNERID) then
      PKG_LOG.Do_log('TUSLVID', 'FK_OWNERID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OWNERID), PKG_LOG.GET_VALUE(:new.FK_OWNERID), :old.fk_id);
    end if;
  end if;
  null;
END TUSLVID_LOG;
/
SHOW ERRORS;


DROP SYNONYM BUH.TUSLVID
/

--
-- TUSLVID  (Synonym) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE SYNONYM BUH.TUSLVID FOR ASU.TUSLVID
/


DROP SYNONYM STAT.TUSLVID
/

--
-- TUSLVID  (Synonym) 
--
--  Dependencies: 
--   TUSLVID (Table)
--
CREATE SYNONYM STAT.TUSLVID FOR ASU.TUSLVID
/


GRANT SELECT ON ASU.TUSLVID TO EXCH43
/

