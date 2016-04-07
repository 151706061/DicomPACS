ALTER TABLE ASU.TIS_GENSTAT
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIS_GENSTAT CASCADE CONSTRAINTS
/

--
-- TIS_GENSTAT  (Table) 
--
--  Dependencies: 
--   TIS_LIST (Table)
--
CREATE TABLE ASU.TIS_GENSTAT
(
  FK_ID                     NUMBER              NOT NULL,
  FC_MUCODE                 VARCHAR2(64 BYTE),
  FD_BEGIN                  DATE,
  FD_END                    DATE,
  FK_IS_LIST_ID             NUMBER,
  FN_ALLHOSPITALCOSTAMOUNT  NUMBER(15,2)
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
-- PK_TIS_GENSTAT  (Index) 
--
--  Dependencies: 
--   TIS_GENSTAT (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIS_GENSTAT ON ASU.TIS_GENSTAT
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
-- TIS_GENSTAT_BI  (Trigger) 
--
--  Dependencies: 
--   TIS_GENSTAT (Table)
--
CREATE OR REPLACE TRIGGER ASU.TIS_GENSTAT_BI
  BEFORE INSERT
  ON ASU.TIS_GENSTAT   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT asu.seq_TIS_GENSTAT.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIS_GENSTAT 
-- 
ALTER TABLE ASU.TIS_GENSTAT ADD (
  CONSTRAINT PK_TIS_GENSTAT
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
-- Foreign Key Constraints for Table TIS_GENSTAT 
-- 
ALTER TABLE ASU.TIS_GENSTAT ADD (
  CONSTRAINT FK_TIS_GENS_REFERENCE_TIS_LIST 
 FOREIGN KEY (FK_IS_LIST_ID) 
 REFERENCES ASU.TIS_LIST (FK_ID))
/

