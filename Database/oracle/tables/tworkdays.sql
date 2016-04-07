ALTER TABLE ASU.TWORKDAYS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TWORKDAYS CASCADE CONSTRAINTS
/

--
-- TWORKDAYS  (Table) 
--
CREATE TABLE ASU.TWORKDAYS
(
  FD_DATE  DATE                                 NOT NULL,
  FL       NUMBER(1)                            NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
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

COMMENT ON TABLE ASU.TWORKDAYS IS 'Рабочие дни
Author: Ura'
/

COMMENT ON COLUMN ASU.TWORKDAYS.FD_DATE IS 'Дата'
/

COMMENT ON COLUMN ASU.TWORKDAYS.FL IS '0-выходной, 1 - рабочий'
/


--
-- PK_TWORKDAYS  (Index) 
--
--  Dependencies: 
--   TWORKDAYS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TWORKDAYS ON ASU.TWORKDAYS
(FD_DATE)
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
-- TWORKDAYS$FL  (Index) 
--
--  Dependencies: 
--   TWORKDAYS (Table)
--
CREATE INDEX ASU.TWORKDAYS$FL ON ASU.TWORKDAYS
(FL)
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


DROP SYNONYM BUH.TWORKDAYS
/

--
-- TWORKDAYS  (Synonym) 
--
--  Dependencies: 
--   TWORKDAYS (Table)
--
CREATE SYNONYM BUH.TWORKDAYS FOR ASU.TWORKDAYS
/


DROP SYNONYM FOOD.TWORKDAYS
/

--
-- TWORKDAYS  (Synonym) 
--
--  Dependencies: 
--   TWORKDAYS (Table)
--
CREATE SYNONYM FOOD.TWORKDAYS FOR ASU.TWORKDAYS
/


-- 
-- Non Foreign Key Constraints for Table TWORKDAYS 
-- 
ALTER TABLE ASU.TWORKDAYS ADD (
  CONSTRAINT PK_TWORKDAYS
 PRIMARY KEY
 (FD_DATE)
    USING INDEX 
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
               ))
/

