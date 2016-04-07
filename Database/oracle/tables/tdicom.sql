DROP TABLE ASU.TDICOM CASCADE CONSTRAINTS
/

--
-- TDICOM  (Table) 
--
CREATE TABLE ASU.TDICOM
(
  FK_ID           NUMBER                        NOT NULL,
  FB_DCM          BLOB                          NOT NULL,
  FC_GUID         VARCHAR2(64 BYTE)             NOT NULL,
  FC_DESCRIPTION  VARCHAR2(100 BYTE)
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
LOB (FB_DCM) STORE AS 
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
-- TDICOM_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TDICOM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDICOM_BEFORE_INS" 
 BEFORE
  INSERT
 ON ASU.TDICOM REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
 SELECT SEQ_TDICOM.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


