ALTER TABLE ASU.TPROC_CNT_PER_DAY
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPROC_CNT_PER_DAY CASCADE CONSTRAINTS
/

--
-- TPROC_CNT_PER_DAY  (Table) 
--
CREATE TABLE ASU.TPROC_CNT_PER_DAY
(
  FK_SMID   NUMBER                              NOT NULL,
  FN_COUNT  NUMBER(4)                           DEFAULT 1                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TPROC_CNT_PER_DAY IS 'Ограничение кол-ва процедур в день на одного человека. Author: Neronov A. 16.08.2011'
/

COMMENT ON COLUMN ASU.TPROC_CNT_PER_DAY.FK_SMID IS 'TSMID.FK_ID - Процедура'
/

COMMENT ON COLUMN ASU.TPROC_CNT_PER_DAY.FN_COUNT IS 'Количество процедур в день'
/


--
-- TPROC_CNT_PER_DAY_BY_SMID  (Index) 
--
--  Dependencies: 
--   TPROC_CNT_PER_DAY (Table)
--
CREATE UNIQUE INDEX ASU.TPROC_CNT_PER_DAY_BY_SMID ON ASU.TPROC_CNT_PER_DAY
(FK_SMID)
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
-- Non Foreign Key Constraints for Table TPROC_CNT_PER_DAY 
-- 
ALTER TABLE ASU.TPROC_CNT_PER_DAY ADD (
  CONSTRAINT TPROC_CNT_PER_DAY_BY_SMID
 PRIMARY KEY
 (FK_SMID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

