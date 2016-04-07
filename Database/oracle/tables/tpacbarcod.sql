ALTER TABLE ASU.TPACBARCOD
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPACBARCOD CASCADE CONSTRAINTS
/

--
-- TPACBARCOD  (Table) 
--
CREATE TABLE ASU.TPACBARCOD
(
  FK_ID       NUMBER                            NOT NULL,
  FK_PACID    NUMBER,
  FB_BARCODE  BLOB
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
LOGGING 
NOCOMPRESS 
LOB (FB_BARCODE) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
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

COMMENT ON TABLE ASU.TPACBARCOD IS 'Штрих коды пациентов. В штрих-кодах зашиты ИД пацов (картинки в формате jpg)'
/

COMMENT ON COLUMN ASU.TPACBARCOD.FB_BARCODE IS 'Картинка штрих-кода'
/


--
-- PK_PACBARCOD  (Index) 
--
--  Dependencies: 
--   TPACBARCOD (Table)
--
CREATE UNIQUE INDEX ASU.PK_PACBARCOD ON ASU.TPACBARCOD
(FK_ID)
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
-- TPACBARCOD_BY_PACID  (Index) 
--
--  Dependencies: 
--   TPACBARCOD (Table)
--
CREATE INDEX ASU.TPACBARCOD_BY_PACID ON ASU.TPACBARCOD
(FK_PACID)
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
-- TPACBARCOD_BAFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPACBARCOD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACBARCOD_BAFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tpacbarcod
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  SELECT SEQ_TPACBARCOD.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPACBARCOD 
-- 
ALTER TABLE ASU.TPACBARCOD ADD (
  CONSTRAINT PK_PACBARCOD
 PRIMARY KEY
 (FK_ID)
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

