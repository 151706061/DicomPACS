ALTER TABLE ASU.THEAL_SMID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.THEAL_SMID CASCADE CONSTRAINTS
/

--
-- THEAL_SMID  (Table) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE TABLE ASU.THEAL_SMID
(
  FK_ID    INTEGER                              NOT NULL,
  FK_HEAL  INTEGER                              NOT NULL,
  FK_SMID  INTEGER                              NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.THEAL_SMID IS 'Связь назначений из стандартов с назначениями в TSMID
Author: Ura'
/

COMMENT ON COLUMN ASU.THEAL_SMID.FK_ID IS 'SEQUENCE=[SEQ_HEAL_SMID]'
/


--
-- PK_THEAL_SMID  (Index) 
--
--  Dependencies: 
--   THEAL_SMID (Table)
--
CREATE UNIQUE INDEX ASU.PK_THEAL_SMID ON ASU.THEAL_SMID
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- THEAL_SMID_HEAL  (Index) 
--
--  Dependencies: 
--   THEAL_SMID (Table)
--
CREATE INDEX ASU.THEAL_SMID_HEAL ON ASU.THEAL_SMID
(FK_HEAL)
NOLOGGING
TABLESPACE INDX
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
-- THEAL_SMID_SMID  (Index) 
--
--  Dependencies: 
--   THEAL_SMID (Table)
--
CREATE INDEX ASU.THEAL_SMID_SMID ON ASU.THEAL_SMID
(FK_SMID)
NOLOGGING
TABLESPACE INDX
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
-- THEAL_SMID$BI  (Trigger) 
--
--  Dependencies: 
--   THEAL_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."THEAL_SMID$BI" 
 BEFORE
  INSERT
 ON theal_smid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.FK_ID IS NULL then
     select SEQ_HEAL_SMID.NEXTVAL INTO :new.FK_ID  from dual;
  end if;

end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table THEAL_SMID 
-- 
ALTER TABLE ASU.THEAL_SMID ADD (
  CONSTRAINT PK_THEAL_SMID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          256K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table THEAL_SMID 
-- 
ALTER TABLE ASU.THEAL_SMID ADD (
  CONSTRAINT FK_THEAL_SM_CK_THEAL__THEAL 
 FOREIGN KEY (FK_HEAL) 
 REFERENCES ASU.THEAL (FK_ID))
/

GRANT SELECT ON ASU.THEAL_SMID TO EXCH43
/

