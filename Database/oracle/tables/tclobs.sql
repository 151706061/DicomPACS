ALTER TABLE ASU.TCLOBS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCLOBS CASCADE CONSTRAINTS
/

--
-- TCLOBS  (Table) 
--
CREATE TABLE ASU.TCLOBS
(
  FK_ID       NUMBER                            NOT NULL,
  FC_CLOB     CLOB,
  FC_COMMENT  VARCHAR2(200 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    40
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          4096M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (FC_CLOB) STORE AS 
      ( TABLESPACE  LOB 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOB
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TCLOBS IS 'Глобальное хранилище ASCII-данных by TimurLan  LABEL=_EXP DATE=16.02.2004 21:43:11'
/

COMMENT ON COLUMN ASU.TCLOBS.FK_ID IS 'SEQUENCE=[SEQ_TBLOBS]'
/

COMMENT ON COLUMN ASU.TCLOBS.FC_CLOB IS 'ASCII
данные'
/

COMMENT ON COLUMN ASU.TCLOBS.FC_COMMENT IS 'комментарий'
/


--
-- TCLOB_ID  (Index) 
--
--  Dependencies: 
--   TCLOBS (Table)
--
CREATE UNIQUE INDEX ASU.TCLOB_ID ON ASU.TCLOBS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          287680K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TCLOBS_FC_COMMENT  (Index) 
--
--  Dependencies: 
--   TCLOBS (Table)
--
CREATE INDEX ASU.TCLOBS_FC_COMMENT ON ASU.TCLOBS
(FC_COMMENT)
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
-- TCLOBS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCLOBS_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TCLOBS FOR EACH ROW
Begin
  SELECT SEQ_TBLOBS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


DROP SYNONYM STAT.TCLOBS
/

--
-- TCLOBS  (Synonym) 
--
--  Dependencies: 
--   TCLOBS (Table)
--
CREATE SYNONYM STAT.TCLOBS FOR ASU.TCLOBS
/


-- 
-- Non Foreign Key Constraints for Table TCLOBS 
-- 
ALTER TABLE ASU.TCLOBS ADD (
  CONSTRAINT TCLOB_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          287680K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TCLOBS TO STAT
/

