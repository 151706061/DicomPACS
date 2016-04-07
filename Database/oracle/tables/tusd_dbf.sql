ALTER TABLE ASU.TUSD_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSD_DBF CASCADE CONSTRAINTS
/

--
-- TUSD_DBF  (Table) 
--
CREATE TABLE ASU.TUSD_DBF
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

COMMENT ON TABLE ASU.TUSD_DBF IS 'Загруженные из USD ошибки выгрузки (создана для решения задачи загрузки ошибок полученных из страховой компании) Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSD_DBF.FK_ID IS 'ASU.SEQ_TUSD_DBF'
/


--
-- K_TUSD_DBF_ID  (Index) 
--
--  Dependencies: 
--   TUSD_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSD_DBF_ID ON ASU.TUSD_DBF
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
-- TUSD_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSD_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSD_DBF_INSERT" 
 BEFORE
  INSERT
 ON asu.TUSD_DBF
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
-- Non Foreign Key Constraints for Table TUSD_DBF 
-- 
ALTER TABLE ASU.TUSD_DBF ADD (
  CONSTRAINT K_TUSD_DBF_ID
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

