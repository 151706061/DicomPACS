ALTER TABLE ASU.TDIAGID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TDIAGID CASCADE CONSTRAINTS
/

--
-- TDIAGID  (Table) 
--
CREATE TABLE ASU.TDIAGID
(
  FK_ID      NUMBER                             NOT NULL,
  FK_DIAGID  NUMBER,
  FK_NAZID   NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          400K
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

COMMENT ON TABLE ASU.TDIAGID IS 'Таблица поставленных диагнозов'
/

COMMENT ON COLUMN ASU.TDIAGID.FK_ID IS 'SEQUENCE=[SEQ_TDIAGID]'
/

COMMENT ON COLUMN ASU.TDIAGID.FK_DIAGID IS 'Код диагноза из TDIAG'
/

COMMENT ON COLUMN ASU.TDIAGID.FK_NAZID IS 'Код назначения из VNAZ'
/


--
-- PK_FKID  (Index) 
--
--  Dependencies: 
--   TDIAGID (Table)
--
CREATE UNIQUE INDEX ASU.PK_FKID ON ASU.TDIAGID
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          240K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TDIAGID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TDIAGID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAGID_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TDIAGID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  select seq_tdiagid.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TDIAGID 
-- 
ALTER TABLE ASU.TDIAGID ADD (
  CONSTRAINT PK_FKID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          240K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

