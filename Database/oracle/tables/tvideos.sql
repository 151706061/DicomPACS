DROP TABLE ASU.TVIDEOS CASCADE CONSTRAINTS
/

--
-- TVIDEOS  (Table) 
--
CREATE TABLE ASU.TVIDEOS
(
  FK_ID           NUMBER                        NOT NULL,
  FC_GUID         VARCHAR2(64 BYTE)             NOT NULL,
  FB_DATA         BLOB                          NOT NULL,
  FC_DESCRIPTION  VARCHAR2(1000 BYTE)
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
LOB (FB_DATA) STORE AS 
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

COMMENT ON TABLE ASU.TVIDEOS IS 'Хранит видео файлы, захваченные web-камерой
Author: rca'
/

COMMENT ON COLUMN ASU.TVIDEOS.FK_ID IS 'Уникальный идентификатор'
/

COMMENT ON COLUMN ASU.TVIDEOS.FC_GUID IS 'GUID для доступа к видео файлам'
/

COMMENT ON COLUMN ASU.TVIDEOS.FB_DATA IS 'Видео файл'
/

COMMENT ON COLUMN ASU.TVIDEOS.FC_DESCRIPTION IS 'Описание к файлу'
/


--
-- TVIDEOS$BI  (Trigger) 
--
--  Dependencies: 
--   TVIDEOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVIDEOS$BI" 
 BEFORE 
 INSERT
 ON ASU.TVIDEOS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  --  Column "FK_ID" uses sequence SEQ_asu.tvideos
 SELECT ASU.SEQ_tvideos.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


