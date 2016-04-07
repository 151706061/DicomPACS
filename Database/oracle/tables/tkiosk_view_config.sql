ALTER TABLE ASU.TKIOSK_VIEW_CONFIG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKIOSK_VIEW_CONFIG CASCADE CONSTRAINTS
/

--
-- TKIOSK_VIEW_CONFIG  (Table) 
--
CREATE TABLE ASU.TKIOSK_VIEW_CONFIG
(
  FK_ID            NUMBER(15)                   NOT NULL,
  FC_HEADER_TEXT   VARCHAR2(255 BYTE),
  IMG_LOGO         BLOB,
  FC_COLOR_FORM    VARCHAR2(25 BYTE),
  FC_COLOR_BUTTON  VARCHAR2(25 BYTE)
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
LOB (IMG_LOGO) STORE AS 
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

COMMENT ON TABLE ASU.TKIOSK_VIEW_CONFIG IS 'Таблица настройки отображения киоска'
/


--
-- TKIOSK_VIEW_CONFIG_BY_ID  (Index) 
--
--  Dependencies: 
--   TKIOSK_VIEW_CONFIG (Table)
--
CREATE UNIQUE INDEX ASU.TKIOSK_VIEW_CONFIG_BY_ID ON ASU.TKIOSK_VIEW_CONFIG
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
-- TKIOSK_VIEW_CONFIG_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TKIOSK_VIEW_CONFIG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKIOSK_VIEW_CONFIG_BEF_INS"
BEFORE INSERT
ON ASU.TKIOSK_VIEW_CONFIG REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  IF :NEW.FK_ID IS NULL THEN
     SELECT ASU.SEQ_TKIOSK_VIEW_CONFIG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TKIOSK_VIEW_CONFIG 
-- 
ALTER TABLE ASU.TKIOSK_VIEW_CONFIG ADD (
  CONSTRAINT TKIOSK_VIEW_CONFIG_BY_ID
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

