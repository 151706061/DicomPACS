DROP TABLE ASU.TAPP CASCADE CONSTRAINTS
/

--
-- TAPP  (Table) 
--
CREATE TABLE ASU.TAPP
(
  FK_ID    NUMBER(15),
  FC_OPIS  VARCHAR2(25 BYTE),
  FC_VER   VARCHAR2(10 BYTE),
  FC_NAME  VARCHAR2(45 BYTE),
  FK_TYPE  NUMBER(9),
  FC_TYPE  VARCHAR2(100 BYTE),
  FB_FILE  BLOB
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          143480K
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
ENABLE ROW MOVEMENT
/

COMMENT ON TABLE ASU.TAPP IS 'Хранилище прграмных модулей и необходимых файлов by TimurLan'
/

COMMENT ON COLUMN ASU.TAPP.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TAPP.FC_OPIS IS 'описание'
/

COMMENT ON COLUMN ASU.TAPP.FC_VER IS 'версия'
/

COMMENT ON COLUMN ASU.TAPP.FC_NAME IS 'название'
/

COMMENT ON COLUMN ASU.TAPP.FK_TYPE IS 'TAPPTYPE.FK_ID'
/

COMMENT ON COLUMN ASU.TAPP.FC_TYPE IS 'TAPPTYPE.FC_NAME'
/

COMMENT ON COLUMN ASU.TAPP.FB_FILE IS 'бинарные данные'
/


--
-- TAPP_UPDATE_BACKUP  (Trigger) 
--
--  Dependencies: 
--   TAPP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_UPDATE_BACKUP" --Created by TimurLan
  BEFORE UPDATE ON ASU.TAPP   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
BEGIN
  IF UPDATING('FB_FILE') THEN
    UPDATE TAPP_BACKUP
       SET FK_ID   = :OLD.FK_ID,
           FC_OPIS = :OLD.FC_OPIS,
           FC_VER  = :OLD.FC_VER,
           FB_FILE = :OLD.FB_FILE,
           FC_NAME = :OLD.FC_NAME,
           FK_TYPE = :OLD.FK_TYPE,
           FC_TYPE = :OLD.FC_TYPE
     WHERE FK_ID = :OLD.FK_ID;
    IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO TAPP_BACKUP
        (FK_ID, FC_OPIS, FC_VER, FB_FILE, FC_NAME, FK_TYPE, FC_TYPE)
      VALUES
        (:OLD.FK_ID,
         :OLD.FC_OPIS,
         :OLD.FC_VER,
         :OLD.FB_FILE,
         :OLD.FC_NAME,
         :OLD.FK_TYPE,
         :OLD.FC_TYPE);
    END IF;
  END IF;
END;
/
SHOW ERRORS;


--
-- TAPP_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TAPP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_UPDATE" 
AFTER  UPDATE  ON ASU.TAPP REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  UPDATE tappview
     SET fc_opis = :new.fc_opis,
         fc_ver = :new.fc_ver,
         fc_name = :new.fc_name
   WHERE fk_id = :new.fk_id;
END;
/
SHOW ERRORS;


--
-- TAPP_INSERT  (Trigger) 
--
--  Dependencies: 
--   TAPP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_INSERT" 
AFTER  INSERT  ON ASU.TAPP REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  INSERT INTO tappview (fk_id, fc_name, fc_opis, fc_ver)
       VALUES (:new.fk_id, :new.fc_name, :new.fc_opis, :new.fc_ver);
END;
/
SHOW ERRORS;


--
-- TAPP_DELETE  (Trigger) 
--
--  Dependencies: 
--   TAPP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TAPP  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  DELETE
    FROM tappview
   WHERE fk_id = :old.fk_id;
END;
/
SHOW ERRORS;


