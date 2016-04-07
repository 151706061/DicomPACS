ALTER TABLE ASU.TIS_LIST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TIS_LIST CASCADE CONSTRAINTS
/

--
-- TIS_LIST  (Table) 
--
CREATE TABLE ASU.TIS_LIST
(
  FK_ID     NUMBER                              NOT NULL,
  FD_DATE   DATE,
  FK_TYPE   NUMBER,
  FD_SEND   DATE,
  FL_SEND   NUMBER,
  FN_RES    NUMBER,
  FC_RES    VARCHAR2(1024 BYTE),
  FL_LOCAL  NUMBER(1)
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

COMMENT ON TABLE ASU.TIS_LIST IS '»Õ“≈√–¿÷»ŒÕÕ¿ﬂ ÿ»Õ¿'
/


--
-- PK_TIS_LIST  (Index) 
--
--  Dependencies: 
--   TIS_LIST (Table)
--
CREATE UNIQUE INDEX ASU.PK_TIS_LIST ON ASU.TIS_LIST
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
-- TIS_LIST_BI  (Trigger) 
--
--  Dependencies: 
--   TIS_LIST (Table)
--
CREATE OR REPLACE TRIGGER ASU.TIS_LIST_BI
  BEFORE INSERT
  ON ASU.TIS_LIST   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT asu.seq_TIS_LIST.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TIS_LIST 
-- 
ALTER TABLE ASU.TIS_LIST ADD (
  CONSTRAINT PK_TIS_LIST
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

