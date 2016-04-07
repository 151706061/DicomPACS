DROP TABLE ASU.TPRIEMNAZ CASCADE CONSTRAINTS
/

--
-- TPRIEMNAZ  (Table) 
--
CREATE TABLE ASU.TPRIEMNAZ
(
  FK_ID        NUMBER                           NOT NULL,
  FK_NAZID     NUMBER,
  FK_PARENTID  NUMBER,
  FK_STATE     NUMBER,
  FL_READ      NUMBER                           DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          8048K
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

COMMENT ON TABLE ASU.TPRIEMNAZ IS 'Таблица-связка с VNAZ. Created by Kolya'
/

COMMENT ON COLUMN ASU.TPRIEMNAZ.FK_ID IS 'SEQUENCE=[SEQ_TPRIEMNAZ]'
/

COMMENT ON COLUMN ASU.TPRIEMNAZ.FK_NAZID IS 'ID назначения из VNAZ (ребенок)'
/

COMMENT ON COLUMN ASU.TPRIEMNAZ.FK_PARENTID IS 'ID назначения из VNAZ (родитель)'
/

COMMENT ON COLUMN ASU.TPRIEMNAZ.FK_STATE IS 'Статус'
/

COMMENT ON COLUMN ASU.TPRIEMNAZ.FL_READ IS 'Признак подтверждения (0-не было никаких действий, 1 - подтверждено, 2-отменено)'
/


--
-- TPRIEMNAZ_BY_PARENTID  (Index) 
--
--  Dependencies: 
--   TPRIEMNAZ (Table)
--
CREATE INDEX ASU.TPRIEMNAZ_BY_PARENTID ON ASU.TPRIEMNAZ
(FK_PARENTID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          8240K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPRIEMNAZ_FKID  (Index) 
--
--  Dependencies: 
--   TPRIEMNAZ (Table)
--
CREATE UNIQUE INDEX ASU.TPRIEMNAZ_FKID ON ASU.TPRIEMNAZ
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4368K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPRIEMNAZ$FK_NAZID  (Index) 
--
--  Dependencies: 
--   TPRIEMNAZ (Table)
--
CREATE INDEX ASU.TPRIEMNAZ$FK_NAZID ON ASU.TPRIEMNAZ
(FK_NAZID)
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
-- TPRIEMNAZ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPRIEMNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPRIEMNAZ_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TPRIEMNAZ  FOR EACH ROW
BEGIN
  SELECT SEQ_TPRIEMNAZ.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPRIEMNAZ 
-- 
ALTER TABLE ASU.TPRIEMNAZ ADD (
  CONSTRAINT TPRIEMNAZ_FKID
 UNIQUE (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          4368K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

