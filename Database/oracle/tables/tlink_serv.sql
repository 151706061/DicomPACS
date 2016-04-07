ALTER TABLE ASU.TLINK_SERV
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLINK_SERV CASCADE CONSTRAINTS
/

--
-- TLINK_SERV  (Table) 
--
CREATE TABLE ASU.TLINK_SERV
(
  FK_ID       NUMBER                            NOT NULL,
  FD_CRATE    DATE,
  FD_DUMP     DATE,
  FC_SCHEMA   VARCHAR2(30 BYTE),
  FC_COMMAND  VARCHAR2(4000 BYTE),
  FN_KEYID    NUMBER,
  FN_NEW      NUMBER,
  FD_NEW      DATE,
  FH_NEW      VARCHAR2(4000 BYTE),
  FC_NEW      CLOB,
  FB_NEW      BLOB
)
TABLESPACE LOG
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1040K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
LOB (FC_NEW) STORE AS 
      ( TABLESPACE  LOG 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOG
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
  LOB (FB_NEW) STORE AS 
      ( TABLESPACE  LOG 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOG
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          128K
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

COMMENT ON TABLE ASU.TLINK_SERV IS 'Системная таблица by TimurLan'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FK_ID IS 'SEQUENCE=[SEQ_TLINK_SERV]'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FD_CRATE IS 'Время создания записи'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FD_DUMP IS 'Время экспорта/импорта записи'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FC_SCHEMA IS 'Название схемы'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FC_COMMAND IS 'Команды, параметры для записи'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FN_KEYID IS 'Ключевое поле (FK_ID)'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FN_NEW IS 'Хранение типа: NUMBER'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FD_NEW IS 'Хранение типа: DATE'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FH_NEW IS 'Хранение типа: VARCHAR'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FC_NEW IS 'Хранение типа: CLOB'
/

COMMENT ON COLUMN ASU.TLINK_SERV.FB_NEW IS 'Хранение типа: BLOB'
/


--
-- TLINK_SERV_BY_ID  (Index) 
--
--  Dependencies: 
--   TLINK_SERV (Table)
--
CREATE UNIQUE INDEX ASU.TLINK_SERV_BY_ID ON ASU.TLINK_SERV
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1040K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TLINK_SERV_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLINK_SERV (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLINK_SERV_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TLINK_SERV   FOR EACH ROW
Begin
  SELECT SEQ_TLINK_SERV.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TLINK_SERV 
-- 
ALTER TABLE ASU.TLINK_SERV ADD (
  CONSTRAINT TLINK_SERV_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          1040K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

