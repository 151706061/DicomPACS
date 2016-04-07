ALTER TABLE ASU.TVAC_PLAN_CONDITION
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PLAN_CONDITION CASCADE CONSTRAINTS
/

--
-- TVAC_PLAN_CONDITION  (Table) 
--
CREATE TABLE ASU.TVAC_PLAN_CONDITION
(
  FK_ID    NUMBER                               NOT NULL,
  FC_NAME  VARCHAR2(64 BYTE)                    NOT NULL
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TVAC_PLAN_CONDITION IS 'Условия, относительно которых планируется поведение  прививки. Author: rca'
/

COMMENT ON COLUMN ASU.TVAC_PLAN_CONDITION.FK_ID IS 'Уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TVAC_PLAN_CONDITION.FC_NAME IS 'Название условия'
/


--
-- PK_TVAC_PLAN_CONDITION  (Index) 
--
--  Dependencies: 
--   TVAC_PLAN_CONDITION (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PLAN_CONDITION ON ASU.TVAC_PLAN_CONDITION
(FK_ID)
NOLOGGING
TABLESPACE INDX
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
-- Non Foreign Key Constraints for Table TVAC_PLAN_CONDITION 
-- 
ALTER TABLE ASU.TVAC_PLAN_CONDITION ADD (
  CONSTRAINT PK_TVAC_PLAN_CONDITION
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
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

