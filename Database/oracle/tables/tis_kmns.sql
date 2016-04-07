ALTER TABLE ASU.TIS_KMNS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIS_KMNS CASCADE CONSTRAINTS
/

--
-- TIS_KMNS  (Table) 
--
--  Dependencies: 
--   TIS_LIST (Table)
--
CREATE TABLE ASU.TIS_KMNS
(
  FK_ID          NUMBER                         NOT NULL,
  FC_MUCODE      VARCHAR2(64 BYTE),
  FD_REFDATE     DATE,
  FK_IS_LIST_ID  NUMBER
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
-- PK_TIS_KMNS  (Index) 
--
--  Dependencies: 
--   TIS_KMNS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIS_KMNS ON ASU.TIS_KMNS
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
-- TIS_KMNS_BI  (Trigger) 
--
--  Dependencies: 
--   TIS_KMNS (Table)
--
CREATE OR REPLACE TRIGGER ASU.TIS_KMNS_BI
  BEFORE INSERT
  ON ASU.TIS_KMNS   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT asu.seq_TIS_KMNS.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIS_KMNS 
-- 
ALTER TABLE ASU.TIS_KMNS ADD (
  CONSTRAINT PK_TIS_KMNS
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
-- Foreign Key Constraints for Table TIS_KMNS 
-- 
ALTER TABLE ASU.TIS_KMNS ADD (
  CONSTRAINT FK_TIS_KMNS_REFERENCE_TIS_LIST 
 FOREIGN KEY (FK_IS_LIST_ID) 
 REFERENCES ASU.TIS_LIST (FK_ID))
/

