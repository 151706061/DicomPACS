ALTER TABLE ASU.TRECEPT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECEPT CASCADE CONSTRAINTS
/

--
-- TRECEPT  (Table) 
--
CREATE TABLE ASU.TRECEPT
(
  FK_ID           NUMBER(9)                     NOT NULL,
  FC_NAME         VARCHAR2(255 BYTE),
  FC_COMMENT      VARCHAR2(2000 BYTE),
  FK_RECEPTVIDID  NUMBER(9),
  FL_DEL          NUMBER(1)                     DEFAULT 0                     NOT NULL,
  FC_WORKAREA     VARCHAR2(10 BYTE)             DEFAULT 'UVRACH'              NOT NULL
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

COMMENT ON TABLE ASU.TRECEPT IS 'Справочник наименование рецептов в аптеке'
/

COMMENT ON COLUMN ASU.TRECEPT.FK_ID IS 'SEQUENCE=[SEQ_TRECEPT]'
/

COMMENT ON COLUMN ASU.TRECEPT.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TRECEPT.FC_COMMENT IS 'Описание'
/

COMMENT ON COLUMN ASU.TRECEPT.FK_RECEPTVIDID IS 'Код по српавочнику видов рецептов'
/

COMMENT ON COLUMN ASU.TRECEPT.FL_DEL IS 'Признак удаления'
/

COMMENT ON COLUMN ASU.TRECEPT.FC_WORKAREA IS 'Рабочая область в которой видны эти рецепты'
/


--
-- TRECEPT_PKY  (Index) 
--
--  Dependencies: 
--   TRECEPT (Table)
--
CREATE UNIQUE INDEX ASU.TRECEPT_PKY ON ASU.TRECEPT
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
-- TRECEPT_INS  (Trigger) 
--
--  Dependencies: 
--   TRECEPT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_INS" 
BEFORE INSERT
ON trecept
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_trecept.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TRECEPT_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECEPT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_DEL" 
BEFORE  DELETE  ON ASU.TRECEPT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  delete from treceptcon where fk_receptid=:old.fk_id;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECEPT 
-- 
ALTER TABLE ASU.TRECEPT ADD (
  CONSTRAINT TRECEPT_PKY
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

