ALTER TABLE ASU.TPRINTEDTL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPRINTEDTL CASCADE CONSTRAINTS
/

--
-- TPRINTEDTL  (Table) 
--
CREATE TABLE ASU.TPRINTEDTL
(
  FK_PACID  NUMBER                              NOT NULL
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

COMMENT ON TABLE ASU.TPRINTEDTL IS 'Какие ТЛ распечатывались : author: Marriage'
/


--
-- PK_TPRINTEDTL  (Index) 
--
--  Dependencies: 
--   TPRINTEDTL (Table)
--
CREATE UNIQUE INDEX ASU.PK_TPRINTEDTL ON ASU.TPRINTEDTL
(FK_PACID)
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
-- Non Foreign Key Constraints for Table TPRINTEDTL 
-- 
ALTER TABLE ASU.TPRINTEDTL ADD (
  CONSTRAINT PK_TPRINTEDTL
 PRIMARY KEY
 (FK_PACID)
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

