ALTER TABLE ASU.TIS_PLAN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIS_PLAN CASCADE CONSTRAINTS
/

--
-- TIS_PLAN  (Table) 
--
--  Dependencies: 
--   TIS_LIST (Table)
--
CREATE TABLE ASU.TIS_PLAN
(
  FK_ID               NUMBER                    NOT NULL,
  FC_MUCODE           VARCHAR2(64 BYTE),
  FN_REFYEAR          NUMBER,
  FN_EMERGENCYPLAN    NUMBER(15,2),
  FN_EMERGENCYBUDGET  NUMBER(15,2),
  FN_VISITCOUNT       NUMBER,
  FK_IS_LIST_ID       NUMBER
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

COMMENT ON TABLE ASU.TIS_PLAN IS 'œÀ¿ÕŒ¬€≈ œŒ ¿«¿“≈À»'
/


--
-- PK_TIS_PLAN  (Index) 
--
--  Dependencies: 
--   TIS_PLAN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIS_PLAN ON ASU.TIS_PLAN
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
-- TIS_PLAN_BI  (Trigger) 
--
--  Dependencies: 
--   TIS_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU.TIS_PLAN_BI
  BEFORE INSERT
  ON ASU.TIS_PLAN   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT asu.seq_TIS_PLAN.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIS_PLAN 
-- 
ALTER TABLE ASU.TIS_PLAN ADD (
  CONSTRAINT PK_TIS_PLAN
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

-- 
-- Foreign Key Constraints for Table TIS_PLAN 
-- 
ALTER TABLE ASU.TIS_PLAN ADD (
  CONSTRAINT FK_TIS_PLAN_REFERENCE_TIS_LIST 
 FOREIGN KEY (FK_IS_LIST_ID) 
 REFERENCES ASU.TIS_LIST (FK_ID))
/

