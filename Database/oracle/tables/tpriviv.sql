ALTER TABLE ASU.TPRIVIV
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPRIVIV CASCADE CONSTRAINTS
/

--
-- TPRIVIV  (Table) 
--
CREATE TABLE ASU.TPRIVIV
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

COMMENT ON TABLE ASU.TPRIVIV IS 'справочник прививок by TimurLan'
/

COMMENT ON COLUMN ASU.TPRIVIV.FK_ID IS 'SEQUENCE=[SEQ_TPRIVIV]'
/

COMMENT ON COLUMN ASU.TPRIVIV.FC_NAME IS 'название'
/


--
-- TPRIVIV_BY_ID  (Index) 
--
--  Dependencies: 
--   TPRIVIV (Table)
--
CREATE UNIQUE INDEX ASU.TPRIVIV_BY_ID ON ASU.TPRIVIV
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
-- TPRIVIV_LOG  (Trigger) 
--
--  Dependencies: 
--   TPRIVIV (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPRIVIV_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPRIVIV  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPRIVIV', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TPRIVIV', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TPRIVIV', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TPRIVIV', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TPRIVIV', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TPRIVIV', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TPRIVIV_LOG;
/
SHOW ERRORS;


--
-- TPRIVIV_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPRIVIV (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPRIVIV_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPRIVIV REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TPRIVIV.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPRIVIV 
-- 
ALTER TABLE ASU.TPRIVIV ADD (
  CONSTRAINT TPRIVIV_BY_ID
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

