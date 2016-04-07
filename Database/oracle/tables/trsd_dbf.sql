ALTER TABLE ASU.TRSD_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRSD_DBF CASCADE CONSTRAINTS
/

--
-- TRSD_DBF  (Table) 
--
CREATE TABLE ASU.TRSD_DBF
(
  FK_ID       NUMBER                            NOT NULL,
  YEAR        NUMBER(4),
  MONTH       NUMBER(2),
  SMK_ID_P    NUMBER(10),
  LPU_ID      NUMBER(10),
  PERSON_IDL  NUMBER(19),
  ID_ILL      NUMBER(19),
  P_ID_ILL    NUMBER(2),
  TOTAL_SMO   NUMBER(10,2),
  SANK_KOD    NUMBER(5),
  UDR_MEK     NUMBER(10,2),
  UDR_MEE     NUMBER(10,2),
  UDR_EKMP    NUMBER(10,2),
  SHTR_MEK    NUMBER(10,2),
  SHTR_MEE    NUMBER(10,2),
  SHTR_EKMP   NUMBER(10,2),
  MSG_DEF     VARCHAR2(120 BYTE),
  LPU_INTR    NUMBER(10)
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

COMMENT ON TABLE ASU.TRSD_DBF IS 'Загруженные из RSD ошибки выгрузки (создана для решения задачи загрузки ошибок полученных из страховой компании) Author:Efimov'
/

COMMENT ON COLUMN ASU.TRSD_DBF.FK_ID IS 'ASU.SEQ_TRSD_DBF'
/


--
-- I_RSD_DBF_BY_KEY  (Index) 
--
--  Dependencies: 
--   TRSD_DBF (Table)
--
CREATE UNIQUE INDEX ASU.I_RSD_DBF_BY_KEY ON ASU.TRSD_DBF
(YEAR, MONTH, LPU_ID, ID_ILL, P_ID_ILL, 
SANK_KOD)
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
-- K_TRSD_DBF_ID  (Index) 
--
--  Dependencies: 
--   TRSD_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TRSD_DBF_ID ON ASU.TRSD_DBF
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
-- TRSD_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRSD_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRSD_DBF_INSERT" 
 BEFORE
  INSERT
 ON asu.TRSD_DBF
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TSLUCH_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRSD_DBF 
-- 
ALTER TABLE ASU.TRSD_DBF ADD (
  CONSTRAINT K_TRSD_DBF_ID
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

