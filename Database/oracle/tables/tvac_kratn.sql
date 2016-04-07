ALTER TABLE ASU.TVAC_KRATN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TVAC_KRATN CASCADE CONSTRAINTS
/

--
-- TVAC_KRATN  (Table) 
--
--  Dependencies: 
--   TINFECTION (Table)
--   TVAC_PEOPLE (Table)
--
CREATE TABLE ASU.TVAC_KRATN
(
  FK_ID          INTEGER                        NOT NULL,
  FK_INFECTION   INTEGER                        NOT NULL,
  FK_VAC_PEOPLE  INTEGER                        NOT NULL,
  FN_KRATN       INTEGER                        NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2168K
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

COMMENT ON TABLE ASU.TVAC_KRATN IS 'Картности вакцинаций
Author: Ura'
/

COMMENT ON COLUMN ASU.TVAC_KRATN.FK_ID IS 'SEQUENCE=[SEQ_VAC_KRATN]'
/

COMMENT ON COLUMN ASU.TVAC_KRATN.FK_INFECTION IS 'TINFECTION.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_KRATN.FK_VAC_PEOPLE IS 'TVAC_PEOPLE.FK_ID'
/

COMMENT ON COLUMN ASU.TVAC_KRATN.FN_KRATN IS 'Кратность вакцинации (V, V1, R1, R2)'
/


--
-- IX_TVAC_KRATN$FK_INFECTION  (Index) 
--
--  Dependencies: 
--   TVAC_KRATN (Table)
--
CREATE INDEX ASU.IX_TVAC_KRATN$FK_INFECTION ON ASU.TVAC_KRATN
(FK_INFECTION)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TVAC_KRATN$FK_VAC_PEOPLE  (Index) 
--
--  Dependencies: 
--   TVAC_KRATN (Table)
--
CREATE INDEX ASU.IX_TVAC_KRATN$FK_VAC_PEOPLE ON ASU.TVAC_KRATN
(FK_VAC_PEOPLE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TVAC_KRATN$FN_KRATN  (Index) 
--
--  Dependencies: 
--   TVAC_KRATN (Table)
--
CREATE INDEX ASU.IX_TVAC_KRATN$FN_KRATN ON ASU.TVAC_KRATN
(FN_KRATN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TVAC_KRATN  (Index) 
--
--  Dependencies: 
--   TVAC_KRATN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TVAC_KRATN ON ASU.TVAC_KRATN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TVAC_KRATN$BI  (Trigger) 
--
--  Dependencies: 
--   TVAC_KRATN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_KRATN$BI" before insert
on TVAC_KRATN for each row
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_KRATN
    select SEQ_VAC_KRATN.NEXTVAL INTO :new.FK_ID from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TVAC_KRATN 
-- 
ALTER TABLE ASU.TVAC_KRATN ADD (
  CONSTRAINT PK_TVAC_KRATN
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          4352K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TVAC_KRATN 
-- 
ALTER TABLE ASU.TVAC_KRATN ADD (
  CONSTRAINT FK_TVAC_KRA_RF_TVAC_K_TINFECTI 
 FOREIGN KEY (FK_INFECTION) 
 REFERENCES ASU.TINFECTION (FK_ID),
  CONSTRAINT FK_TVAC_KRA_RF_TVAC_K_TVAC_PEO 
 FOREIGN KEY (FK_VAC_PEOPLE) 
 REFERENCES ASU.TVAC_PEOPLE (FK_ID))
/

