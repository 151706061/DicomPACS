ALTER TABLE ASU.TIS_VMP_SMP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIS_VMP_SMP CASCADE CONSTRAINTS
/

--
-- TIS_VMP_SMP  (Table) 
--
--  Dependencies: 
--   TIS_VMP (Table)
--
CREATE TABLE ASU.TIS_VMP_SMP
(
  FK_ID           NUMBER                        NOT NULL,
  FK_FEDERALMOID  NUMBER,
  FK_PROFILEID    NUMBER,
  FN_PEOPLECOUNT  NUMBER,
  FK_IS_VMP_ID    NUMBER,
  FL_IS_VMP       NUMBER(1)
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
-- PK_TIS_VMP_SMP  (Index) 
--
--  Dependencies: 
--   TIS_VMP_SMP (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIS_VMP_SMP ON ASU.TIS_VMP_SMP
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
-- TIS_VMP_SMP_BI  (Trigger) 
--
--  Dependencies: 
--   TIS_VMP_SMP (Table)
--
CREATE OR REPLACE TRIGGER ASU.TIS_VMP_SMP_BI
  BEFORE INSERT
  ON ASU.TIS_VMP_SMP   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT asu.seq_TIS_VMP_SMP.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIS_VMP_SMP 
-- 
ALTER TABLE ASU.TIS_VMP_SMP ADD (
  CONSTRAINT PK_TIS_VMP_SMP
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
-- Foreign Key Constraints for Table TIS_VMP_SMP 
-- 
ALTER TABLE ASU.TIS_VMP_SMP ADD (
  CONSTRAINT FK_TIS_VMP__REFERENCE_TIS_VMP 
 FOREIGN KEY (FK_IS_VMP_ID) 
 REFERENCES ASU.TIS_VMP (FK_ID))
/

