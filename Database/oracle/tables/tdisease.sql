ALTER TABLE ASU.TDISEASE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDISEASE CASCADE CONSTRAINTS
/

--
-- TDISEASE  (Table) 
--
CREATE TABLE ASU.TDISEASE
(
  FK_ID    NUMBER(15)                           NOT NULL,
  FC_NAME  VARCHAR2(100 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TDISEASE IS 'справочник болезней кот. мог болеть пациент by TimurLan'
/

COMMENT ON COLUMN ASU.TDISEASE.FK_ID IS 'SEQUENCE=[SEQ_TDISEASE]'
/

COMMENT ON COLUMN ASU.TDISEASE.FC_NAME IS 'Название'
/


--
-- TDISEASE_BY_ID  (Index) 
--
--  Dependencies: 
--   TDISEASE (Table)
--
CREATE UNIQUE INDEX ASU.TDISEASE_BY_ID ON ASU.TDISEASE
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
-- TDISEASE_LOG  (Trigger) 
--
--  Dependencies: 
--   TDISEASE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDISEASE_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TDISEASE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TDISEASE', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TDISEASE', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TDISEASE', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TDISEASE', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TDISEASE', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TDISEASE', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TDISEASE_LOG;
/
SHOW ERRORS;


--
-- TDISEASE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TDISEASE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDISEASE_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TDISEASE REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TDISEASE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDISEASE 
-- 
ALTER TABLE ASU.TDISEASE ADD (
  CONSTRAINT TDISEASE_BY_ID
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

