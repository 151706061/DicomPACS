DROP TABLE ASU.TLECHCONT CASCADE CONSTRAINTS
/

--
-- TLECHCONT  (Table) 
--
CREATE TABLE ASU.TLECHCONT
(
  FK_ID       NUMBER(9)                         NOT NULL,
  FK_RESID    NUMBER(9)                         NOT NULL,
  FK_NAZID    NUMBER(9)                         NOT NULL,
  FK_MEDICID  NUMBER(9)                         NOT NULL,
  FN_COLVO    NUMBER(9,2)                       NOT NULL,
  FK_SMID     NUMBER(9)                         NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON COLUMN ASU.TLECHCONT.FK_ID IS 'SEQUENCE=[SEQ_TLECHCONT]'
/

COMMENT ON COLUMN ASU.TLECHCONT.FK_RESID IS 'Код результата назначения'
/

COMMENT ON COLUMN ASU.TLECHCONT.FK_NAZID IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TLECHCONT.FK_MEDICID IS 'Код медикамента'
/

COMMENT ON COLUMN ASU.TLECHCONT.FN_COLVO IS 'Количество'
/

COMMENT ON COLUMN ASU.TLECHCONT.FK_SMID IS 'Код названия назначения'
/


--
-- TLECHCONT#ID  (Index) 
--
--  Dependencies: 
--   TLECHCONT (Table)
--
CREATE UNIQUE INDEX ASU.TLECHCONT#ID ON ASU.TLECHCONT
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
-- TLECHCONT_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLECHCONT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLECHCONT_BEFOR_INSERT" 
BEFORE INSERT
ON ASU.TLECHCONT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT SEQ_TLECHCONT.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TLECHCONT 
-- 
ALTER TABLE ASU.TLECHCONT ADD (
  CONSTRAINT TLECHCONT#ID
 UNIQUE (FK_ID)
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

