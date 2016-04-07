DROP TABLE ASU.TAPP_BACKUP CASCADE CONSTRAINTS
/

--
-- TAPP_BACKUP  (Table) 
--
CREATE TABLE ASU.TAPP_BACKUP
(
  FK_ID    NUMBER(15),
  FC_OPIS  VARCHAR2(25 BYTE),
  FC_VER   VARCHAR2(10 BYTE),
  FB_FILE  BLOB,
  FC_NAME  VARCHAR2(45 BYTE),
  FK_TYPE  NUMBER(9),
  FC_TYPE  VARCHAR2(100 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          10M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (FB_FILE) STORE AS 
      ( TABLESPACE  LOB 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE LOB
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

COMMENT ON TABLE ASU.TAPP_BACKUP IS 'Хранилище предыдущих версий файлов (TAPP) Created by TimurLan'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FC_OPIS IS 'описание'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FC_VER IS 'версия'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FB_FILE IS 'бинарные данные'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FC_NAME IS 'название'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FK_TYPE IS 'TAPPTYPE.FK_ID'
/

COMMENT ON COLUMN ASU.TAPP_BACKUP.FC_TYPE IS 'TAPPTYPE.FC_NAME'
/


