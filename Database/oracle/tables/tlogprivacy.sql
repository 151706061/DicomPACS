DROP TABLE ASU.TLOGPRIVACY CASCADE CONSTRAINTS
/

--
-- TLOGPRIVACY  (Table) 
--
CREATE TABLE ASU.TLOGPRIVACY
(
  FK_ID        NUMBER                           NOT NULL,
  FK_PEPL_ID   NUMBER                           NOT NULL,
  FK_SOTR_ID   NUMBER                           NOT NULL,
  FD_DATE      DATE                             DEFAULT sysdate               NOT NULL,
  FC_COMMENT   VARCHAR2(900 BYTE)               NOT NULL,
  FC_USERNAME  VARCHAR2(100 BYTE),
  FC_MACHINE   VARCHAR2(300 BYTE),
  FC_MODULE    VARCHAR2(100 BYTE)
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
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TLOGPRIVACY IS 'Shpielevoy. Логирование выгрузки личных данных пациента'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FK_PEPL_ID IS 'TPeople.fk_id'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FK_SOTR_ID IS 'сотр. , выгрузивший данные пациента'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FD_DATE IS 'дата выгрузки'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FC_COMMENT IS 'причина, по которой были выгружены данные'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FC_USERNAME IS 'имя пользователя'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FC_MACHINE IS 'название комьютера, откуда запущена программа'
/

COMMENT ON COLUMN ASU.TLOGPRIVACY.FC_MODULE IS 'название программы'
/


--
-- TLOGPRIVACY_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLOGPRIVACY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLOGPRIVACY_INSERT" 
 BEFORE
  INSERT
 ON asu.TLOGPRIVACY
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare

 cursor cSession is
  select username, machine, module
  from v$session
 where sid =(select sid from v$mystat where rownum = 1);
 
Begin
  SELECT SEQ_TLOGPRIVACY.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  
  open  cSession;
  fetch cSession into :NEW.FC_USERNAME, :NEW.FC_MACHINE, :NEW.FC_MODULE;  
  close cSession;
    
End;
/
SHOW ERRORS;


