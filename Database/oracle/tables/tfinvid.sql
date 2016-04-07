DROP TABLE ASU.TFINVID CASCADE CONSTRAINTS
/

--
-- TFINVID  (Table) 
--
CREATE TABLE ASU.TFINVID
(
  FK_ID       NUMBER                            NOT NULL,
  FC_NAME     VARCHAR2(30 BYTE),
  FC_SHORT    VARCHAR2(10 BYTE),
  FL_DEFAULT  NUMBER                            DEFAULT 0
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

COMMENT ON TABLE ASU.TFINVID IS 'Справочник "Виды финансирования" by TimurLan'
/

COMMENT ON COLUMN ASU.TFINVID.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TFINVID.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TFINVID.FC_SHORT IS 'кратко'
/

COMMENT ON COLUMN ASU.TFINVID.FL_DEFAULT IS 'значение по-умолчанию'
/


--
-- TFINVID_LOG  (Trigger) 
--
--  Dependencies: 
--   TFINVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFINVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TFINVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TFINVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TFINVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TFINVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TFINVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TFINVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TFINVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TFINVID_LOG;
/
SHOW ERRORS;


--
-- TFINVID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TFINVID (Table)
--
CREATE OR REPLACE TRIGGER ASU.tfinvid_before_insert
 BEFORE
  INSERT
 ON ASU.TFINVID REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :NEW.FK_ID is null then
    SELECT SEQ_TFINVID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
end;
/
SHOW ERRORS;


