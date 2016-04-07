ALTER TABLE ASU.TDIAGSL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDIAGSL CASCADE CONSTRAINTS
/

--
-- TDIAGSL  (Table) 
--
CREATE TABLE ASU.TDIAGSL
(
  FK_DIAGID    NUMBER                           NOT NULL,
  FK_SLINFOID  NUMBER                           NOT NULL
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

COMMENT ON TABLE ASU.TDIAGSL IS '“авлица св€зки диагноза и листка нетрудоспособности -- Kashiara O.A. 21.10.2011'
/

COMMENT ON COLUMN ASU.TDIAGSL.FK_DIAGID IS ' од диагноза из таблицы ASU.TDIAG'
/

COMMENT ON COLUMN ASU.TDIAGSL.FK_SLINFOID IS ' од документа нетрудоспособности из таблицы ASU.TSLINFO'
/


--
-- RDIAGSL_PK  (Index) 
--
--  Dependencies: 
--   TDIAGSL (Table)
--
CREATE UNIQUE INDEX ASU.RDIAGSL_PK ON ASU.TDIAGSL
(FK_SLINFOID, FK_DIAGID)
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
-- Non Foreign Key Constraints for Table TDIAGSL 
-- 
ALTER TABLE ASU.TDIAGSL ADD (
  CONSTRAINT RDIAGSL_PK
 PRIMARY KEY
 (FK_SLINFOID, FK_DIAGID)
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

