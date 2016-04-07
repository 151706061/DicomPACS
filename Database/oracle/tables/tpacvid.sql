ALTER TABLE ASU.TPACVID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPACVID CASCADE CONSTRAINTS
/

--
-- TPACVID  (Table) 
--
CREATE TABLE ASU.TPACVID
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FC_NAME     VARCHAR2(100 BYTE),
  FL_DEFAULT  NUMBER(1)                         DEFAULT 0,
  FC_SHORT    VARCHAR2(100 BYTE)
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

COMMENT ON TABLE ASU.TPACVID IS 'Справочник "Вид пациента" by TimurLan '
/

COMMENT ON COLUMN ASU.TPACVID.FK_ID IS 'SEQUENCE=[SEQ_TPACVID]'
/

COMMENT ON COLUMN ASU.TPACVID.FC_NAME IS 'название'
/

COMMENT ON COLUMN ASU.TPACVID.FL_DEFAULT IS 'знач. по-умолчанию'
/

COMMENT ON COLUMN ASU.TPACVID.FC_SHORT IS 'кратко'
/


--
-- TPACVID_BY_ID  (Index) 
--
--  Dependencies: 
--   TPACVID (Table)
--
CREATE UNIQUE INDEX ASU.TPACVID_BY_ID ON ASU.TPACVID
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
-- TPACVID_LOG  (Trigger) 
--
--  Dependencies: 
--   TPACVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPACVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPACVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TPACVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TPACVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TPACVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TPACVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TPACVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TPACVID_LOG;
/
SHOW ERRORS;


--
-- TPACVID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPACVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACVID_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TPACVID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT SEQ_TPACVID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPACVID 
-- 
ALTER TABLE ASU.TPACVID ADD (
  CONSTRAINT TPACVID_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

