ALTER TABLE ASU.TICD10_MODERN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TICD10_MODERN CASCADE CONSTRAINTS
/

--
-- TICD10_MODERN  (Table) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE TABLE ASU.TICD10_MODERN
(
  FK_ID           NUMBER(6)                     NOT NULL,
  FK_ICD10        INTEGER                       NOT NULL,
  FK_ADD          INTEGER,
  FD_DATE         DATE,
  FN_MINDAYCOUNT  NUMBER                        DEFAULT -1,
  FN_MAXDAYCOUNT  NUMBER                        DEFAULT -1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TICD10_MODERN IS 'Диагнозы относящиеся к программе модернизации здравоохранения Author: Efimov'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FK_ID IS 'SEQUENCE=[SEQ_icd10_MODERN]'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FK_ICD10 IS 'Ticd10.fk_id'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FK_ADD IS '1 - добавлили в программу, 0 -искючили из программы'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FD_DATE IS 'Дата добавления или исключения из программы (в зависимости от значения FK_ADD)'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FN_MINDAYCOUNT IS 'Начало отрезка в койко-днях, стационарный случай может быть отнесён к программе модернизации, только если его длительность (кол-во койко-дней) лежит на отрезке.'
/

COMMENT ON COLUMN ASU.TICD10_MODERN.FN_MAXDAYCOUNT IS 'Конец отрезка в койко-днях, стационарный случай может быть отнесён к программе модернизации, только если его длительность (кол-во койко-дней) лежит на отрезке.'
/


--
-- IDX_TICD10_MODERN_ICD10  (Index) 
--
--  Dependencies: 
--   TICD10_MODERN (Table)
--
CREATE INDEX ASU.IDX_TICD10_MODERN_ICD10 ON ASU.TICD10_MODERN
(FK_ICD10)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TICD10_MODERN  (Index) 
--
--  Dependencies: 
--   TICD10_MODERN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TICD10_MODERN ON ASU.TICD10_MODERN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          448K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- "Ticd10_MODERN$BI"  (Trigger) 
--
--  Dependencies: 
--   TICD10_MODERN (Table)
--
CREATE OR REPLACE TRIGGER ASU."Ticd10_MODERN$BI" before insert
on ASU.Ticd10_MODERN for each row
begin
    --  Column "FK_ID" uses sequence SEQ_icd10_MODERN
    if :new.FK_ID is null then
      select SEQ_icd10_MODERN.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TICD10_MODERN 
-- 
ALTER TABLE ASU.TICD10_MODERN ADD (
  CONSTRAINT PK_TICD10_MODERN
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          448K
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TICD10_MODERN 
-- 
ALTER TABLE ASU.TICD10_MODERN ADD (
  CONSTRAINT FK_TICD10_MODERN_ST 
 FOREIGN KEY (FK_ICD10) 
 REFERENCES ASU.TICD10 (FK_ID)
    ON DELETE CASCADE)
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TICD10_MODERN TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TICD10_MODERN TO EXCH43
/

