ALTER TABLE ASU.TVID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVID CASCADE CONSTRAINTS
/

--
-- TVID  (Table) 
--
CREATE TABLE ASU.TVID
(
  FK_ID        NUMBER(15)                       DEFAULT 0                     NOT NULL,
  FC_NAME      VARCHAR2(100 BYTE),
  FC_VID       VARCHAR2(100 BYTE),
  FK_FINVIDID  NUMBER(9),
  FL_DEFAULT   NUMBER(1)                        DEFAULT 0
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

COMMENT ON TABLE ASU.TVID IS 'Справочник типов прибытия by TimurLan '
/

COMMENT ON COLUMN ASU.TVID.FK_ID IS 'SEQUENCE=[SEQ_TVID]'
/

COMMENT ON COLUMN ASU.TVID.FC_NAME IS 'кратко'
/

COMMENT ON COLUMN ASU.TVID.FC_VID IS 'название'
/

COMMENT ON COLUMN ASU.TVID.FK_FINVIDID IS 'код финансирования'
/

COMMENT ON COLUMN ASU.TVID.FL_DEFAULT IS 'по-умолчанию'
/


--
-- TVID_PRIMARYKEY  (Index) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE UNIQUE INDEX ASU.TVID_PRIMARYKEY ON ASU.TVID
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
-- TVID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVID_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TVID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT SEQ_TVID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TVID_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVID_BEFORE_UPDATE" 
  BEFORE UPDATE ON ASU.TVID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  UPDATE TSUBVID SET FK_VIDID = :NEW.FK_ID WHERE FK_VIDID = :OLD.FK_ID;
End;
/
SHOW ERRORS;


--
-- TVID_BEFOR_INSERT_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVID_BEFOR_INSERT_UPDATE" 
  BEFORE INSERT OR UPDATE ON ASU.TVID   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  null;
  /* disabled by TimurLan :NEW.FC_VID:=:NEW.FC_NAME;*/
End;
/
SHOW ERRORS;


--
-- TVID_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVID_DELETE_ALL" 
  AFTER DELETE ON ASU.TVID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  Delete from TSUBVID where FK_VidId = :OLD.FK_ID;
end;
/
SHOW ERRORS;


--
-- TVID_LOG  (Trigger) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVID_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TVID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TVID', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TVID', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
    PKG_LOG.Do_log('TVID', 'FK_FINVIDID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_FINVIDID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TVID', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TVID', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
    PKG_LOG.Do_log('TVID', 'FK_FINVIDID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_FINVIDID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TVID', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TVID', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
    if UPDATING ('FK_FINVIDID') AND PKG_LOG.GET_VALUE(:old.FK_FINVIDID) <> PKG_LOG.GET_VALUE(:new.FK_FINVIDID) then
      PKG_LOG.Do_log('TVID', 'FK_FINVIDID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_FINVIDID), PKG_LOG.GET_VALUE(:new.FK_FINVIDID), :old.fk_id);
    end if;
  end if;
  null;
END TVID_LOG;
/
SHOW ERRORS;


DROP SYNONYM BUH.TVID
/

--
-- TVID  (Synonym) 
--
--  Dependencies: 
--   TVID (Table)
--
CREATE SYNONYM BUH.TVID FOR ASU.TVID
/


-- 
-- Non Foreign Key Constraints for Table TVID 
-- 
ALTER TABLE ASU.TVID ADD (
  CONSTRAINT TVID_PRIMARYKEY
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

