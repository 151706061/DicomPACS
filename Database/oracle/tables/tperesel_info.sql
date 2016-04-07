ALTER TABLE ASU.TPERESEL_INFO
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPERESEL_INFO CASCADE CONSTRAINTS
/

--
-- TPERESEL_INFO  (Table) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE TABLE ASU.TPERESEL_INFO
(
  FK_PERESEL     NUMBER(15)                     DEFAULT -1                    NOT NULL,
  FK_TRANSFSOTR  NUMBER(15)                     DEFAULT -1                    NOT NULL,
  FL_IN_INTERIM  NUMBER(1)                      DEFAULT 0                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TPERESEL_INFO IS 'ТАБЛИЦА ПЕРЕСЕЛЕНИЙ ПАЦИЕНТА, ДОПОЛНИТЕЛЬНЫЕ ПАРАМЕТРЫ AUTHOR: EFIMOV'
/

COMMENT ON COLUMN ASU.TPERESEL_INFO.FK_PERESEL IS 'ASU.TPERESEL.FK_ID'
/

COMMENT ON COLUMN ASU.TPERESEL_INFO.FK_TRANSFSOTR IS 'Врач осуществивший перевод пациента - LOGIN.TSOTR_ID'
/

COMMENT ON COLUMN ASU.TPERESEL_INFO.FL_IN_INTERIM IS '1 - перевод из основного во временное отделение, 0 - перевод из одного основного в другое (для одного основного отделения допустим перевод в одно временное и в одно основное)'
/


--
-- PK_PERESEL_INFO  (Index) 
--
--  Dependencies: 
--   TPERESEL_INFO (Table)
--
CREATE UNIQUE INDEX ASU.PK_PERESEL_INFO ON ASU.TPERESEL_INFO
(FK_PERESEL, FL_IN_INTERIM)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table TPERESEL_INFO 
-- 
ALTER TABLE ASU.TPERESEL_INFO ADD (
  CONSTRAINT PK_PERESEL_INFO
 PRIMARY KEY
 (FK_PERESEL, FL_IN_INTERIM)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TPERESEL_INFO 
-- 
ALTER TABLE ASU.TPERESEL_INFO ADD (
  CONSTRAINT FK_PERESEL_INFO_PR 
 FOREIGN KEY (FK_PERESEL) 
 REFERENCES ASU.TPERESEL (FK_ID)
    ON DELETE CASCADE)
/

