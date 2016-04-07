DROP TABLE ASU.TRESMED CASCADE CONSTRAINTS
/

--
-- TRESMED  (Table) 
--
CREATE TABLE ASU.TRESMED
(
  FK_ID             NUMBER(9),
  FD_DATA           DATE,
  FK_SOTRID         NUMBER(9),
  FK_NAZMEDID       NUMBER(9),
  FK_APOSTAVSHIKID  NUMBER(9),
  FK_RECEPTID       NUMBER(9),
  FK_NAPRID         NUMBER(9)                   DEFAULT 0
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

COMMENT ON TABLE ASU.TRESMED IS 'Таблица результатов выполнения медикаментозных назначений'
/

COMMENT ON COLUMN ASU.TRESMED.FK_ID IS 'SEQUENCE=[SEQ_TRESMED]'
/

COMMENT ON COLUMN ASU.TRESMED.FD_DATA IS 'когда'
/

COMMENT ON COLUMN ASU.TRESMED.FK_SOTRID IS 'код сотрудника который произвел назначение'
/

COMMENT ON COLUMN ASU.TRESMED.FK_NAZMEDID IS 'код назначения по которому идет выдача'
/

COMMENT ON COLUMN ASU.TRESMED.FK_APOSTAVSHIKID IS 'с кого списывается'
/

COMMENT ON COLUMN ASU.TRESMED.FK_RECEPTID IS 'код выдаваемого рецепта'
/

COMMENT ON COLUMN ASU.TRESMED.FK_NAPRID IS 'Признак отбора'
/


--
-- TRESMED_BY_NAZMEDID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE INDEX ASU.TRESMED_BY_NAZMEDID ON ASU.TRESMED
(FK_NAZMEDID)
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
-- TRESMED$DATA  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE INDEX ASU.TRESMED$DATA ON ASU.TRESMED
(FD_DATA)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED$FK_POSTAVSHIKID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE INDEX ASU.TRESMED$FK_POSTAVSHIKID ON ASU.TRESMED
(FK_APOSTAVSHIKID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          640K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED$ID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE UNIQUE INDEX ASU.TRESMED$ID ON ASU.TRESMED
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          640K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED$ID$RECEPTID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE UNIQUE INDEX ASU.TRESMED$ID$RECEPTID ON ASU.TRESMED
(FK_ID, FK_RECEPTID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED$NAPRID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE INDEX ASU.TRESMED$NAPRID ON ASU.TRESMED
(FK_NAPRID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED$RECEPTID  (Index) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE INDEX ASU.TRESMED$RECEPTID ON ASU.TRESMED
(FK_RECEPTID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          640K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMED_INS  (Trigger) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMED_INS" 
  BEFORE INSERT ON ASU.TRESMED   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
BEGIN
  SELECT seq_tresmed.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


--
-- TRESMED$SALDO  (Trigger) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMED$SALDO" 
AFTER INSERT OR UPDATE OF FD_DATA
ON ASU.TRESMED REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  UPDATE tresmedcont
     SET fn_kol = fn_kol
   WHERE fk_resmedid = :old.fk_id;
END;
/
SHOW ERRORS;


--
-- TRESMED$AD  (Trigger) 
--
--  Dependencies: 
--   TRESMED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMED$AD" 
AFTER DELETE
ON ASU.TRESMED REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  DELETE
    FROM tresmedcont
   WHERE fk_resmedid = :old.fk_id;
END;
/
SHOW ERRORS;


