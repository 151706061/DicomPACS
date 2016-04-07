DROP TABLE ASU.TCOC_POL CASCADE CONSTRAINTS
/

--
-- TCOC_POL  (Table) 
--
CREATE TABLE ASU.TCOC_POL
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FC_NAME     VARCHAR2(100 BYTE),
  FC_SHORT    VARCHAR2(100 BYTE),
  FL_DEFAULT  NUMBER(1)                         DEFAULT 0
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

COMMENT ON TABLE ASU.TCOC_POL IS 'Справочник "Социальное положение" by TimurLan '
/

COMMENT ON COLUMN ASU.TCOC_POL.FK_ID IS 'SEQUENCE=[SEQ_TCOC_POL]'
/

COMMENT ON COLUMN ASU.TCOC_POL.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TCOC_POL.FC_SHORT IS 'кратко'
/

COMMENT ON COLUMN ASU.TCOC_POL.FL_DEFAULT IS 'значение по-умолчанию'
/


--
-- TCOC_POL_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TCOC_POL (Table)
--
CREATE UNIQUE INDEX ASU.TCOC_POL_BY_FK_ID ON ASU.TCOC_POL
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TCOC_POL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCOC_POL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOC_POL_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TCOC_POL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TCOC_POL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TCOC_POL_LOG  (Trigger) 
--
--  Dependencies: 
--   TCOC_POL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOC_POL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TCOC_POL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TCOC_POL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TCOC_POL', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TCOC_POL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TCOC_POL', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TCOC_POL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TCOC_POL', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TCOC_POL_LOG;
/
SHOW ERRORS;


DROP SYNONYM STAT.TCOC_POL
/

--
-- TCOC_POL  (Synonym) 
--
--  Dependencies: 
--   TCOC_POL (Table)
--
CREATE SYNONYM STAT.TCOC_POL FOR ASU.TCOC_POL
/


