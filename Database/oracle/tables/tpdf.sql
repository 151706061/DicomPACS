DROP TABLE ASU.TPDF CASCADE CONSTRAINTS
/

--
-- TPDF  (Table) 
--
CREATE TABLE ASU.TPDF
(
  FK_ID           NUMBER                        NOT NULL,
  FB_PDF          BLOB                          NOT NULL,
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
LOB (FB_PDF) STORE AS 
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
-- TPDF_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TPDF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPDF_BEFORE_INS" 
 BEFORE
  INSERT
 ON ASU.TPDF REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
 SELECT SEQ_TPDF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


