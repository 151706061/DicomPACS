ALTER TABLE ASU.TVAC_TEST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_TEST CASCADE CONSTRAINTS
/

--
-- TVAC_TEST  (Table) 
--
CREATE TABLE ASU.TVAC_TEST
(
  FK_ID    INTEGER                              NOT NULL,
  FC_NAME  VARCHAR2(150 BYTE)                   NOT NULL,
  FC_REM   INTEGER
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

COMMENT ON TABLE ASU.TVAC_TEST IS 'Вакцинация :: справочник проб
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_TEST.FK_ID IS 'SEQUENCE=[SEQ_VAC_TEST]'
/

COMMENT ON COLUMN ASU.TVAC_TEST.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TVAC_TEST.FC_REM IS 'Описание'
/


--
-- PK_TVAC_TEST  (Index) 
--
--  Dependencies: 
--   TVAC_TEST (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_TEST ON ASU.TVAC_TEST
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
-- TVAC_TEST_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TVAC_TEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_TEST_BEFORE_INSERT" BEFORE INSERT
ON ASU.TVAC_TEST FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_TEST
      IF :NEW.FK_ID IS NULL
      THEN
         SELECT SEQ_VAC_TEST.NEXTVAL INTO :NEW.FK_ID from dual;
      END IF;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_TEST 
-- 
ALTER TABLE ASU.TVAC_TEST ADD (
  CONSTRAINT PK_TVAC_TEST
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

