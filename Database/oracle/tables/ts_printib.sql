ALTER TABLE ASU.TS_PRINTIB
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TS_PRINTIB CASCADE CONSTRAINTS
/

--
-- TS_PRINTIB  (Table) 
--
CREATE TABLE ASU.TS_PRINTIB
(
  FC_NAME   VARCHAR2(100 BYTE),
  FC_FUNC   VARCHAR2(100 BYTE),
  FL_PRINT  NUMBER(1)                           DEFAULT 1,
  FN_ORDER  NUMBER(9)                           DEFAULT -1,
  FK_ID     NUMBER                              NOT NULL
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

COMMENT ON TABLE ASU.TS_PRINTIB IS 'Настройки печати разделов ИБ by TimurLan'
/

COMMENT ON COLUMN ASU.TS_PRINTIB.FC_NAME IS 'Название раздела'
/

COMMENT ON COLUMN ASU.TS_PRINTIB.FC_FUNC IS 'Название ф-ции пакета TEXTIB возвращающего клоб раздела'
/

COMMENT ON COLUMN ASU.TS_PRINTIB.FL_PRINT IS 'Печатать(1) или нет(0)?'
/

COMMENT ON COLUMN ASU.TS_PRINTIB.FN_ORDER IS 'Порядок'
/

COMMENT ON COLUMN ASU.TS_PRINTIB.FK_ID IS 'SEQUENCE=[SEQ_TS_PRINTIB]'
/


--
-- TS_PRINTIB_BY_ID  (Index) 
--
--  Dependencies: 
--   TS_PRINTIB (Table)
--
CREATE UNIQUE INDEX ASU.TS_PRINTIB_BY_ID ON ASU.TS_PRINTIB
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
-- TS_PRINTIB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TS_PRINTIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TS_PRINTIB_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TS_PRINTIB   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
BEGIN
  select seq_ts_printib.nextval into :new.fk_id from dual;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TS_PRINTIB 
-- 
ALTER TABLE ASU.TS_PRINTIB ADD (
  CONSTRAINT TS_PRINTIB_BY_ID
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

