ALTER TABLE ASU.TSKUD_PEOPLES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSKUD_PEOPLES CASCADE CONSTRAINTS
/

--
-- TSKUD_PEOPLES  (Table) 
--
CREATE TABLE ASU.TSKUD_PEOPLES
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_PEOPLES  NUMBER(15),
  FC_RFID     VARCHAR2(20 BYTE),
  IMAGE       BLOB
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
LOB (IMAGE) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        RETENTION
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

COMMENT ON TABLE ASU.TSKUD_PEOPLES IS '— ”ƒ. Author:Oleinikov'
/

COMMENT ON COLUMN ASU.TSKUD_PEOPLES.FK_PEOPLES IS '—сылка на пипла (TPEOPLES)'
/

COMMENT ON COLUMN ASU.TSKUD_PEOPLES.FC_RFID IS 'ID RFID'
/

COMMENT ON COLUMN ASU.TSKUD_PEOPLES.IMAGE IS '‘ото'
/


--
-- TSKUD_PEOPLES_BY_ID  (Index) 
--
--  Dependencies: 
--   TSKUD_PEOPLES (Table)
--
CREATE UNIQUE INDEX ASU.TSKUD_PEOPLES_BY_ID ON ASU.TSKUD_PEOPLES
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
-- TSKUD_PEOPLES_FK_PEOPLES  (Index) 
--
--  Dependencies: 
--   TSKUD_PEOPLES (Table)
--
CREATE INDEX ASU.TSKUD_PEOPLES_FK_PEOPLES ON ASU.TSKUD_PEOPLES
(FK_PEOPLES)
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
-- TSKUD_PEOPLES_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TSKUD_PEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSKUD_PEOPLES_BEF_INS"
BEFORE INSERT
ON ASU.TSKUD_PEOPLES REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  IF :NEW.FK_ID IS NULL THEN
     SELECT ASU.SEQ_TSKUD_PEOPLES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSKUD_PEOPLES 
-- 
ALTER TABLE ASU.TSKUD_PEOPLES ADD (
  CONSTRAINT TSKUD_PEOPLES_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

