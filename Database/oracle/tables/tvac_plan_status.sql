ALTER TABLE ASU.TVAC_PLAN_STATUS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PLAN_STATUS CASCADE CONSTRAINTS
/

--
-- TVAC_PLAN_STATUS  (Table) 
--
CREATE TABLE ASU.TVAC_PLAN_STATUS
(
  FK_ID    NUMBER(1)                            NOT NULL,
  FC_NAME  VARCHAR2(20 BYTE)                    NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
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

COMMENT ON TABLE ASU.TVAC_PLAN_STATUS IS 'Названия статусов планов
Author: Ura'
/


--
-- PK_TVAC_PLAN_STATUS  (Index) 
--
--  Dependencies: 
--   TVAC_PLAN_STATUS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PLAN_STATUS ON ASU.TVAC_PLAN_STATUS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


-- 
-- Non Foreign Key Constraints for Table TVAC_PLAN_STATUS 
-- 
ALTER TABLE ASU.TVAC_PLAN_STATUS ADD (
  CONSTRAINT PK_TVAC_PLAN_STATUS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

