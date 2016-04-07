ALTER TABLE ASU.TLABREPTEMPLATE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLABREPTEMPLATE CASCADE CONSTRAINTS
/

--
-- TLABREPTEMPLATE  (Table) 
--
CREATE TABLE ASU.TLABREPTEMPLATE
(
  FK_ID           NUMBER,
  FK_SOTRID       NUMBER,
  FC_NAME         VARCHAR2(100 BYTE),
  FC_DESCRIPTION  VARCHAR2(500 BYTE),
  FC_VALUE        CLOB
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
LOB (FC_VALUE) STORE AS 
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


--
-- TLABREPTEMPLATE_BY_ID  (Index) 
--
--  Dependencies: 
--   TLABREPTEMPLATE (Table)
--
CREATE UNIQUE INDEX ASU.TLABREPTEMPLATE_BY_ID ON ASU.TLABREPTEMPLATE
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
-- TLABREPTEMPLATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLABREPTEMPLATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLABREPTEMPLATE_BEFORE_INSERT" 
 BEFORE INSERT ON ASU.TLABREPTEMPLATE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 IF :NEW.FK_ID IS NULL THEN
  SELECT SEQ_TLABREPTEMPLATE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TLABREPTEMPLATE 
-- 
ALTER TABLE ASU.TLABREPTEMPLATE ADD (
  CONSTRAINT TLABREPTEMPLATE_BY_ID
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

