ALTER TABLE ASU.TVAC_PLAN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_PLAN CASCADE CONSTRAINTS
/

--
-- TVAC_PLAN  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--   TVAC_PLAN_STATUS (Table)
--
CREATE TABLE ASU.TVAC_PLAN
(
  FK_ID          INTEGER                        NOT NULL,
  FK_INFECTION   INTEGER                        NOT NULL,
  FK_PEOPLE      INTEGER                        NOT NULL,
  FN_KRATN       INTEGER                        NOT NULL,
  FK_VAC_CANCEL  INTEGER,
  FD             DATE                           NOT NULL,
  FN_STATUS      NUMBER(1)                      DEFAULT 1                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
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

COMMENT ON TABLE ASU.TVAC_PLAN IS 'Индививдуальный план прививок'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FK_ID IS 'SEQUENCE=[SEQ_VAC_PLAN]'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FK_INFECTION IS 'Инфекция'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FN_KRATN IS 'Картность'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FK_VAC_CANCEL IS 'Ссылка на отвод'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FD IS 'Предпалагаемая дата'
/

COMMENT ON COLUMN ASU.TVAC_PLAN.FN_STATUS IS '1-план; 2-выполнено; 3-отвод(отмена)'
/


--
-- IX_TVAC_PLAN$FK_INFECT  (Index) 
--
--  Dependencies: 
--   TVAC_PLAN (Table)
--
CREATE INDEX ASU.IX_TVAC_PLAN$FK_INFECT ON ASU.TVAC_PLAN
(FK_INFECTION)
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
-- IX_TVAC_PLAN$FK_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_PLAN (Table)
--
CREATE INDEX ASU.IX_TVAC_PLAN$FK_PEOPLE ON ASU.TVAC_PLAN
(FK_PEOPLE)
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
-- PK_TVAC_PLAN  (Index) 
--
--  Dependencies: 
--   TVAC_PLAN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_PLAN ON ASU.TVAC_PLAN
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
-- TVAC_PLAN$BI  (Trigger) 
--
--  Dependencies: 
--   TVAC_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PLAN$BI" 
 BEFORE 
 INSERT
 ON ASU.TVAC_PLAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_PLAN
    select SEQ_VAC_PLAN.NEXTVAL INTO :new.FK_ID from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_PLAN 
-- 
ALTER TABLE ASU.TVAC_PLAN ADD (
  CONSTRAINT PK_TVAC_PLAN
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

-- 
-- Foreign Key Constraints for Table TVAC_PLAN 
-- 
ALTER TABLE ASU.TVAC_PLAN ADD (
  CONSTRAINT FK_TVAC_PLAN$TVAC_PLAN_STATUS 
 FOREIGN KEY (FN_STATUS) 
 REFERENCES ASU.TVAC_PLAN_STATUS (FK_ID),
  CONSTRAINT FK_TVAC_PLA_RF_TVAC_P_TINFECTI 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID))
/

