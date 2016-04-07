ALTER TABLE ASU.TOPER_SMID
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TOPER_SMID CASCADE CONSTRAINTS
/

--
-- TOPER_SMID  (Table) 
--
CREATE TABLE ASU.TOPER_SMID
(
  FK_ID      NUMBER                             NOT NULL,
  FK_SMIDID  NUMBER                             NOT NULL
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TOPER_SMID IS 'Отметка "операция" для назначений смида(для выгрузки) AUTHOR:Kosov  '
/

COMMENT ON COLUMN ASU.TOPER_SMID.FK_ID IS 'SEQUENCE=[SEQ_TOPER_SMID]'
/

COMMENT ON COLUMN ASU.TOPER_SMID.FK_SMIDID IS 'Код ASU.TSMID.FK_ID'
/


--
-- TTOPERSMID_PRIMA_KEY  (Index) 
--
--  Dependencies: 
--   TOPER_SMID (Table)
--
CREATE UNIQUE INDEX ASU.TTOPERSMID_PRIMA_KEY ON ASU.TOPER_SMID
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
-- TTOPERSMID_UNI_KEY  (Index) 
--
--  Dependencies: 
--   TOPER_SMID (Table)
--
CREATE UNIQUE INDEX ASU.TTOPERSMID_UNI_KEY ON ASU.TOPER_SMID
(FK_SMIDID)
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
-- TOPER_SMID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TOPER_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TOPER_SMID_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TOPER_SMID   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT asu.SEQ_TOPER_SMID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TOPER_SMID 
-- 
ALTER TABLE ASU.TOPER_SMID ADD (
  CONSTRAINT TTOPERSMID_PRIMA_KEY
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
               ),
  CONSTRAINT TTOPERSMID_UNI_KEY
 UNIQUE (FK_SMIDID)
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

