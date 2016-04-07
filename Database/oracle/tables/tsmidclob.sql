DROP TABLE ASU.TSMIDCLOB CASCADE CONSTRAINTS
/

--
-- TSMIDCLOB  (Table) 
--
CREATE TABLE ASU.TSMIDCLOB
(
  FK_ID    NUMBER                               NOT NULL,
  FK_SMID  NUMBER(15),
  FC_TEXT  CLOB
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
LOB (FC_TEXT) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
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

COMMENT ON TABLE ASU.TSMIDCLOB IS '“¿¡À»÷¿ —ŒŒ“¬≈“—“¬»… TSMID.FK_ID » “≈ —“¿ (CLOB)'
/

COMMENT ON COLUMN ASU.TSMIDCLOB.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TSMIDCLOB.FK_SMID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TSMIDCLOB.FC_TEXT IS '“≈ —“'
/


--
-- TSMIDCLOB_ID  (Index) 
--
--  Dependencies: 
--   TSMIDCLOB (Table)
--
CREATE UNIQUE INDEX ASU.TSMIDCLOB_ID ON ASU.TSMIDCLOB
(FK_ID)
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
-- TSMIDCLOB_SMID  (Index) 
--
--  Dependencies: 
--   TSMIDCLOB (Table)
--
CREATE INDEX ASU.TSMIDCLOB_SMID ON ASU.TSMIDCLOB
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
-- TSMIDCLOB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSMIDCLOB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMIDCLOB_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tsmidclob
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  SELECT SEQ_TSMIDCLOB.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


