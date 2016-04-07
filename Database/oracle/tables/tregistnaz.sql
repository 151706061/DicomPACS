ALTER TABLE ASU.TREGISTNAZ
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TREGISTNAZ CASCADE CONSTRAINTS
/

--
-- TREGISTNAZ  (Table) 
--
CREATE TABLE ASU.TREGISTNAZ
(
  FK_NAZID  NUMBER                              NOT NULL
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


--
-- PK_TREGISTNAZ  (Index) 
--
--  Dependencies: 
--   TREGISTNAZ (Table)
--
CREATE UNIQUE INDEX ASU.PK_TREGISTNAZ ON ASU.TREGISTNAZ
(FK_NAZID)
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
-- Non Foreign Key Constraints for Table TREGISTNAZ 
-- 
ALTER TABLE ASU.TREGISTNAZ ADD (
  CONSTRAINT PK_TREGISTNAZ
 PRIMARY KEY
 (FK_NAZID)
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

