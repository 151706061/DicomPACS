ALTER TABLE ASU.TSOTR_NAPR_UCH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSOTR_NAPR_UCH CASCADE CONSTRAINTS
/

--
-- TSOTR_NAPR_UCH  (Table) 
--
CREATE TABLE ASU.TSOTR_NAPR_UCH
(
  FK_SOTRID  NUMBER                             NOT NULL,
  FK_SMID    NUMBER
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

COMMENT ON TABLE ASU.TSOTR_NAPR_UCH IS 'Соответствие направившего учреждения и сотрудника Author: Marriage'
/

COMMENT ON COLUMN ASU.TSOTR_NAPR_UCH.FK_SOTRID IS 'TSotr.FK_ID или Totdel.FK_ID'
/

COMMENT ON COLUMN ASU.TSOTR_NAPR_UCH.FK_SMID IS 'TSmid.FK_ID'
/


--
-- PK_SOTR_NAPR_UCH  (Index) 
--
--  Dependencies: 
--   TSOTR_NAPR_UCH (Table)
--
CREATE UNIQUE INDEX ASU.PK_SOTR_NAPR_UCH ON ASU.TSOTR_NAPR_UCH
(FK_SOTRID)
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
-- Non Foreign Key Constraints for Table TSOTR_NAPR_UCH 
-- 
ALTER TABLE ASU.TSOTR_NAPR_UCH ADD (
  CONSTRAINT PK_SOTR_NAPR_UCH
 PRIMARY KEY
 (FK_SOTRID)
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

