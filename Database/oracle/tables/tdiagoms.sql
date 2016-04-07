ALTER TABLE ASU.TDIAGOMS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDIAGOMS CASCADE CONSTRAINTS
/

--
-- TDIAGOMS  (Table) 
--
CREATE TABLE ASU.TDIAGOMS
(
  FK_ID         NUMBER                          NOT NULL,
  FK_SMID       NUMBER,
  FK_TYPEDOCID  NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TDIAGOMS IS '—оответстви€ между диагнозами и типом оплаты Author: Marriage'
/


--
-- PK_DIAGOMS  (Index) 
--
--  Dependencies: 
--   TDIAGOMS (Table)
--
CREATE UNIQUE INDEX ASU.PK_DIAGOMS ON ASU.TDIAGOMS
(FK_ID)
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
-- TDIAGOMS$BI  (Trigger) 
--
--  Dependencies: 
--   TDIAGOMS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAGOMS$BI" before insert
on ASU.TDIAGOMS for each row
begin
    --  Column "FK_ID" uses sequence SEQ_icd10_MODERN
    if :new.FK_ID is null then
      select ASU.SEQ_TDIAGOMS.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDIAGOMS 
-- 
ALTER TABLE ASU.TDIAGOMS ADD (
  CONSTRAINT PK_DIAGOMS
 PRIMARY KEY
 (FK_ID)
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

