ALTER TABLE ASU.TSTOL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSTOL CASCADE CONSTRAINTS
/

--
-- TSTOL  (Table) 
--
CREATE TABLE ASU.TSTOL
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

COMMENT ON TABLE ASU.TSTOL IS 'Справочник столовых by TimurLan'
/

COMMENT ON COLUMN ASU.TSTOL.FK_ID IS 'SEQUENCE=[SEQ_TSTOL]'
/

COMMENT ON COLUMN ASU.TSTOL.FC_NAME IS 'название'
/


--
-- TSTOL_BY_ID  (Index) 
--
--  Dependencies: 
--   TSTOL (Table)
--
CREATE UNIQUE INDEX ASU.TSTOL_BY_ID ON ASU.TSTOL
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
-- TSTOL_LOG  (Trigger) 
--
--  Dependencies: 
--   TSTOL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTOL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSTOL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSTOL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TSTOL', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSTOL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TSTOL', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSTOL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TSTOL', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TSTOL_LOG;
/
SHOW ERRORS;


--
-- TSTOL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSTOL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTOL_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TSTOL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TSTOL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSTOL 
-- 
ALTER TABLE ASU.TSTOL ADD (
  CONSTRAINT TSTOL_BY_ID
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

