ALTER TABLE ASU.TAPOSTAVSHIK
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TAPOSTAVSHIK CASCADE CONSTRAINTS
/

--
-- TAPOSTAVSHIK  (Table) 
--
CREATE TABLE ASU.TAPOSTAVSHIK
(
  FK_ID        NUMBER(9)                        NOT NULL,
  FC_NAME      VARCHAR2(255 BYTE)               NOT NULL,
  FC_FULLNAME  VARCHAR2(4000 BYTE)
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

COMMENT ON COLUMN ASU.TAPOSTAVSHIK.FK_ID IS 'SEQUENCE=[SEQ_TAPOSTAVSHIK]'
/


--
-- TAPOSTAVSHIK_PK  (Index) 
--
--  Dependencies: 
--   TAPOSTAVSHIK (Table)
--
CREATE UNIQUE INDEX ASU.TAPOSTAVSHIK_PK ON ASU.TAPOSTAVSHIK
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAPOSTVSHIK_DEL  (Trigger) 
--
--  Dependencies: 
--   TAPOSTAVSHIK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPOSTVSHIK_DEL" 
BEFORE DELETE
ON ASU.TAPOSTAVSHIK REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgTAPOSTAVSHIK.isExistsAprih(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить поставщика, т.к. есть данные о поставках от него');
   END IF;
END;
/
SHOW ERRORS;


--
-- TAPOSTAVSHIK  (Trigger) 
--
--  Dependencies: 
--   TAPOSTAVSHIK (Table)
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TAPOSTAVSHIK (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TAPOSTAVSHIK" 
BEFORE  INSERT  ON ASU.TAPOSTAVSHIK REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  SELECT seq_tapostavshik.nextval
    INTO :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TAPOSTAVSHIK 
-- 
ALTER TABLE ASU.TAPOSTAVSHIK ADD (
  CONSTRAINT TAPOSTAVSHIK_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          512K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

