ALTER TABLE ASU.TUSD_DBF_TEMP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSD_DBF_TEMP CASCADE CONSTRAINTS
/

--
-- TUSD_DBF_TEMP  (Table) 
--
CREATE TABLE ASU.TUSD_DBF_TEMP
(
  FK_ID       NUMBER                            NOT NULL,
  YEAR        NUMBER(4),
  MONTH       NUMBER(2),
  LPU_ID      NUMBER(10),
  PERSON_IDL  NUMBER(19),
  ID_ILL_U    NUMBER(19),
  ID_ILL      NUMBER(19),
  P_ID_ILL    NUMBER(2),
  SUM_EO_SMO  NUMBER(10,2)
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

COMMENT ON TABLE ASU.TUSD_DBF_TEMP IS 'Загруженные из USD ошибки выгрузки (создана для решения задачи загрузки ошибок полученных из страховой компании) Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSD_DBF_TEMP.FK_ID IS 'ASU.SEQ_TUSD_DBF_TEMP'
/


--
-- K_TUSD_DBF_TEMP_ID  (Index) 
--
--  Dependencies: 
--   TUSD_DBF_TEMP (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSD_DBF_TEMP_ID ON ASU.TUSD_DBF_TEMP
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
-- TUSD_DBF_TEMP_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSD_DBF_TEMP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSD_DBF_TEMP_INSERT" 
 BEFORE
  INSERT
 ON asu.TUSD_DBF_TEMP
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TUSL_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSD_DBF_TEMP 
-- 
ALTER TABLE ASU.TUSD_DBF_TEMP ADD (
  CONSTRAINT K_TUSD_DBF_TEMP_ID
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

