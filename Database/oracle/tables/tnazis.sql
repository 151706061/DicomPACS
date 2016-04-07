ALTER TABLE ASU.TNAZIS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZIS CASCADE CONSTRAINTS
/

--
-- TNAZIS  (Table) 
--
CREATE TABLE ASU.TNAZIS
(
  FK_ID               NUMBER(15)                NOT NULL,
  FK_SMID             NUMBER(15),
  FC_REMARK           VARCHAR2(4000 BYTE),
  FD_NAZ              DATE,
  FD_RUN              DATE,
  FK_ROOMID           NUMBER(9)                 DEFAULT 0                     NOT NULL,
  FK_ISPOLID          NUMBER(15)                DEFAULT 0,
  FK_VRACHID          NUMBER(15),
  FK_NAZSOSID         NUMBER(15),
  FK_PACID            NUMBER(15),
  FK_RESULTID         NUMBER(15)                DEFAULT -1,
  FC_NAME             VARCHAR2(100 BYTE),
  FL_PLAT             VARCHAR2(3 BYTE),
  FC_TYPE             VARCHAR2(50 BYTE),
  FL_INS              NUMBER(1),
  FL_IN_RASPIS        NUMBER(1)                 DEFAULT 0,
  FL_ISVRACHVIEW      NUMBER(1),
  FL_MORE_PUT         NUMBER(1)                 DEFAULT 0,
  FK_DOCID            NUMBER(15),
  FK_NAZTYPEID        NUMBER(15),
  FK_NAZOWNER         NUMBER(15)                DEFAULT -1,
  FC_ACCESSIONNUMBER  VARCHAR2(50 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          3424K
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

COMMENT ON TABLE ASU.TNAZIS IS 'Назначения исследований
  '
/

COMMENT ON COLUMN ASU.TNAZIS.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_SMID IS 'Код проводимого исследования'
/

COMMENT ON COLUMN ASU.TNAZIS.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TNAZIS.FD_NAZ IS 'Дата создания назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FD_RUN IS 'Дата регистрации/проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_VRACHID IS 'Код врача, проводившего исследования'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_NAZSOSID IS 'Состояние назначения(по справочнику TNAZSOS)'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_RESULTID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZIS.FC_NAME IS 'Название назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FL_PLAT IS 'Признак необходимости оплаты назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FC_TYPE IS 'Тип назначения'
/

COMMENT ON COLUMN ASU.TNAZIS.FL_INS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZIS.FL_IN_RASPIS IS 'Признак присутствия назначения в расписании'
/

COMMENT ON COLUMN ASU.TNAZIS.FL_ISVRACHVIEW IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZIS.FL_MORE_PUT IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZIS.FK_NAZOWNER IS 'Код назначения'
/


--
-- TNAZIS_ALL  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_ALL ON ASU.TNAZIS
(FK_ID, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_NAZSOSID, 
FK_PACID, FL_IN_RASPIS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2304K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_BY_DATA_PACID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_BY_DATA_PACID ON ASU.TNAZIS
(FK_PACID, FD_RUN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2176K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_BY_ID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE UNIQUE INDEX ASU.TNAZIS_BY_ID ON ASU.TNAZIS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          704K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_BY_ID_NAZSOSID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE UNIQUE INDEX ASU.TNAZIS_BY_ID_NAZSOSID ON ASU.TNAZIS
(FK_ID, FK_NAZSOSID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_BY_ID_PACID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_BY_ID_PACID ON ASU.TNAZIS
(FK_ID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_BY_NAZOWNER  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_BY_NAZOWNER ON ASU.TNAZIS
(FK_NAZOWNER)
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
-- TNAZIS_BY_PACID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_BY_PACID ON ASU.TNAZIS
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1152K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_DATE  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_DATE ON ASU.TNAZIS
(FD_RUN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1536K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_FK_NAZSOSID_PACID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_FK_NAZSOSID_PACID ON ASU.TNAZIS
(FK_NAZSOSID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1408K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_FK_NAZSOS_PACID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE UNIQUE INDEX ASU.TNAZIS_FK_NAZSOS_PACID ON ASU.TNAZIS
(FK_NAZSOSID, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1792K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_SMID_INS  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_SMID_INS ON ASU.TNAZIS
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_SOS_RASPIS  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_SOS_RASPIS ON ASU.TNAZIS
(FL_IN_RASPIS, FK_NAZSOSID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZIS_SOS_VRACHID  (Index) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE INDEX ASU.TNAZIS_SOS_VRACHID ON ASU.TNAZIS
(FK_VRACHID, FD_NAZ)
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
-- TNAZIS_UPDATE_TSMINI  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_UPDATE_TSMINI" 
 BEFORE 
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   sMODULENAME VARCHAR2(3000);
   NNUM   NUMBER;
   NCNT   NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
   IF (sMODULENAME <> 'List_xrays_lab.exe') AND (sMODULENAME <> 'List_xrays_vrach.exe') AND (sMODULENAME <> 'RgRegistr.exe') THEN

--raise_application_error (-20000, '!update');

     IF :NEW.FC_TYPE IS NULL THEN

       SELECT FC_VALUE -- берем последний порядковый номер
         INTO NNUM
         FROM TSMINI
        WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';

       SELECT COUNT(*) -- проверяем является ли данное назначение рентгенологическим
         INTO NCNT
         FROM DUAL
        WHERE EXISTS (SELECT FK_ID
                        FROM TSMID
                       WHERE FL_SHOWANAL = 1 AND FL_SHOWPRINT = 1 AND TSMID.FK_ID = :NEW.FK_SMID
                      CONNECT BY PRIOR FK_ID = FK_OWNER
                      START WITH FK_ID in (ASU.GET_RG_ISSL, asu.get_rad_issl));

       IF NCNT > 0 THEN
         NNUM := NNUM + 1;
         :NEW.FC_TYPE := TO_CHAR (NNUM); -- если рентгеновское то увеличиваем порядковый номер на 1

       ASU.DO_UPDATE_TSMINI(nNUM);
--       UPDATE TSMINI SET FC_VALUE = TO_CHAR (NNUM) WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';
       END IF;
     END IF;
   END IF;
END;
/
SHOW ERRORS;


--
-- TNAZIS_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_DELETE" 
 BEFORE
  DELETE
 ON asu.tnazis
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  DELETE FROM tib WHERE fk_pacid = :old.fk_id;
  DELETE FROM tresis WHERE fk_nazid = :old.fk_id;
  DELETE FROM TNAZGROUP WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TTUBPARAM WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM asu.tpaclst where nazid = :old.fk_id; -- added by Prihodko N. 23.05.2011  

  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
  DELETE FROM vnaz WHERE fk_id = :old.fk_id;
  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
 --   RAISE;
--   BEGIN
--     o_neurosoft_link.prc_delete_files(:old.fk_id);--by TimurLan 4 Kapusta's neurosoft
--     EXCEPTION WHEN OTHERS THEN NULL;
--   END;
END;
/
SHOW ERRORS;


--
-- TNAZIS_BEFORE_DELETE_MULTIVOX  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_BEFORE_DELETE_MULTIVOX" 
 BEFORE 
 DELETE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(100);
  sGUID VARCHAR2(36);
  nOwner NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
-- -->> 1. Проверяем происходит ли добавление через модули рентгена
  IF (sMODULENAME = 'List_xrays_lab.exe') OR
     (sMODULENAME = 'List_xrays_vrach.exe') OR
     (sMODULENAME = 'RgRegistr.exe') OR
     (sMODULENAME = 'TestMultiVox.exe') THEN
    sGUID := NEW_UUID;
    INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
    VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
           ASU.SET_CLOB_MULTIVOX(:OLD.FK_ID,
                                 :OLD.FK_PACID,
                                 :OLD.FK_VRACHID,
                                 :OLD.FD_RUN, 
                                 :OLD.FC_TYPE,
                                 :OLD.FK_SMID,
                                 :OLD.FK_ISPOLID,
                                 :OLD.FK_ROOMID,
                                 sGUID,
                                 :OLD.FK_NAZSOSID,
                                 'CA'),
           systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :OLD.FK_ID);
  else
    select fk_owner into nOwner from asu.tsmid where fk_id = :old.fk_smid;
    if nOwner = asu.get_endoscop_issl then
      sGUID := NEW_UUID;
      INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
      VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
             ASU.SET_CLOB_MULTIVOX(:OLD.FK_ID,
                                   :OLD.FK_PACID,
                                   :OLD.FK_VRACHID,
                                   :OLD.FD_RUN,
                                   :OLD.FC_TYPE,
                                   :OLD.FK_SMID,
                                   :OLD.FK_ISPOLID,
                                   :OLD.FK_ROOMID,
                                   sGUID,
                                   :OLD.FK_NAZSOSID,
                                   'CA'),
             systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :OLD.FK_ID);
    end if;
  END IF; 
END;
/
SHOW ERRORS;


--
-- TNAZIS_BEFORE_UPDATE_MULTIVOX  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_BEFORE_UPDATE_MULTIVOX" 
 BEFORE 
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(100);
  sGUID VARCHAR2(36);
  nOwner NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
-- -->> 1. Проверяем происходит ли добавление через модули рентгена
  IF (sMODULENAME = 'List_xrays_lab.exe') OR
     (sMODULENAME = 'List_xrays_vrach.exe') OR
     (sMODULENAME = 'RgRegistr.exe') OR
     (sMODULENAME = 'TestMultiVox.exe') THEN
    sGUID := NEW_UUID;
    INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
    VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
           ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                 :NEW.FK_PACID,
                                 :NEW.FK_VRACHID,
                                 :NEW.FD_RUN, 
                                 :NEW.FC_TYPE,
                                 :NEW.FK_SMID,
                                 :NEW.FK_ISPOLID,
                                 :NEW.FK_ROOMID,
                                 sGUID,
                                 :NEW.FK_NAZSOSID,
                                 'XO'),
           systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
  else
    select fk_owner into nOwner from asu.tsmid where fk_id = :new.fk_smid;
    if nOwner = asu.get_endoscop_issl then
      if :new.fk_nazsosid <> asu.get_pass_registrator then
        sGUID := NEW_UUID;
        INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
        VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
               ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                     :NEW.FK_PACID,
                                     :NEW.FK_VRACHID,
                                     :NEW.FD_RUN,
                                     :NEW.FC_TYPE,
                                     :NEW.FK_SMID,
                                     :NEW.FK_ISPOLID,
                                     :NEW.FK_ROOMID,
                                     sGUID,
                                     :NEW.FK_NAZSOSID,
                                     'XO'),
               systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
      end if;
    end if;
  END IF; -- <<-- 1
END;
/
SHOW ERRORS;


--
-- TNAZIS_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


--
-- TNAZIS_AFTER_INSERT_MULTIVOX  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT_MULTIVOX" 
 AFTER 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(100);
  sGUID VARCHAR2(36);
  nOwner NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
-- -->> 1. Проверяем происходит ли добавление через модули рентгена или Тестовый модуль для Мультивокса
  IF (sMODULENAME = 'List_xrays_lab.exe') OR
     (sMODULENAME = 'List_xrays_vrach.exe') OR
     (sMODULENAME = 'RgRegistr.exe') OR
     (sMODULENAME = 'TestMultiVox.exe') THEN

    sGUID := NEW_UUID;
    INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
    VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
           ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                 :NEW.FK_PACID,
                                 :NEW.FK_VRACHID,
                                 :NEW.FD_RUN, 
                                 :NEW.FC_TYPE,
                                 :NEW.FK_SMID,
                                 :NEW.FK_ISPOLID,
                                 :NEW.FK_ROOMID,
                                 sGUID,
                                 :NEW.FK_NAZSOSID),
           systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
  else -- если не через модули ренгена, то проверяем что за исследование
    select fk_owner into nOwner from asu.tsmid where fk_id = :new.fk_smid;
    if nOwner = asu.get_endoscop_issl then
      if :new.fk_nazsosid <> asu.get_pass_registrator then
        sGUID := NEW_UUID;
        INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
        VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
               ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                     :NEW.FK_PACID,
                                     :NEW.FK_VRACHID,
                                     :NEW.FD_RUN,
                                     :NEW.FC_TYPE,
                                     :NEW.FK_SMID,
                                     :NEW.FK_ISPOLID,
                                     :NEW.FK_ROOMID,
                                     sGUID,
                                     :NEW.FK_NAZSOSID),
               systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
      end if;
    end if;           
  END IF; 
END;
/
SHOW ERRORS;


--
-- TNAZIS_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT" 
  AFTER INSERT ON asu.tnazis
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
DISABLE
BEGIN
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  -- (с) 25.01.2004 Капустин А.В.
  -- Создать выходной XML файл с назначением
  IF pkg_smini.readstring('NEUROSOFT', 'OUTPUT', 'NO') = 'YES' THEN
    pkg_neurosoft_link.prc_create_ip_xml_file(:new.fk_id,:new.fk_smid,:new.fk_pacid);
  END IF;
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END;
/
SHOW ERRORS;


--
-- TNAZIS_AFTER_INSERT_TSMINI  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT_TSMINI" 
 BEFORE 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(3000);
  nCnt NUMBER;
  nNum NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');

  IF (sMODULENAME <> 'List_xrays_lab.exe') AND (sMODULENAME <> 'List_xrays_vrach.exe') AND (sMODULENAME <> 'RgRegistr.exe') THEN

--raise_application_error (-20000, '!insert');

    SELECT FC_VALUE INTO nNum
      FROM TSMINI
     WHERE FC_SECTION = 'XRAY_NAPRAVLENIE'
       AND FC_KEY = 'ID_NUMBER'; -- берем порядковый номер из TSMINI
       
    SELECT COUNT (*) INTO nCnt
      FROM DUAL
    WHERE EXISTS (SELECT fk_id
                    FROM tsmid
                   WHERE fl_showanal = 1
                     AND  fl_showprint = 1
                     AND tsmid.fk_id = :NEW.fk_smid
                  CONNECT BY PRIOR fk_id = fk_owner
                  START WITH fk_id in (asu.get_rg_issl, asu.get_rad_issl)); -- проверяем рентгеновское ли это назначение
                  
    IF nCnt > 0 THEN -- если рентгеновское то прибавляем 1 к порядковому номеру
      nNUM := nNUM + 1;
      :NEW.FC_TYPE := TO_CHAR(nNUM);
      ASU.DO_UPDATE_TSMINI(nNUM);
--      UPDATE TSMINI SET FC_VALUE = TO_CHAR(nNUM) WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';
 --     commit;
    END IF;
END IF;
END;
/
SHOW ERRORS;


--
-- TNAZIS_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    begin
      if :NEW.FK_ID is null then
        SELECT SEQ_TKARTA.NEXTVAL
          INTO :NEW.FK_ID
          FROM DUAL;
      end if;
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  SELECT SEQ_TKARTA.NEXTVAL
    INTO :NEW.FK_ID
    FROM DUAL;
  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
    INSERT INTO vnaz (fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
 else
    INSERT INTO vnaz (fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,:new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
 end if;
  insert into tnazgroup(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
    values(:new.FK_ID, GET_GROUPID_BY_SMID(:new.FK_SMID), :new.FD_RUN, :new.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :NEW.FD_RUN);

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
    end;
  END IF;
END;
/
SHOW ERRORS;


--
-- TNAZIS_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
begin
  if insnaz.bins then
--  asu.do_log_err('вылетело');
    return;
  end if;
  insnaz.bins:=true;
      UPDATE vnaz
         SET fk_smid = :new.fk_smid,fc_remark = :new.fc_remark,fd_naz = :new.fd_naz,fd_run = :new.fd_run,fk_roomid = :new.fk_roomid,
             fk_ispolid = :new.fk_ispolid,fk_vrachid = :new.fk_vrachid,fk_nazsosid = :new.fk_nazsosid,fk_pacid = :new.fk_pacid,
             fk_resultid = :new.fk_resultid,fc_name = :new.fc_name,fl_plat = :new.fl_plat,fc_type = :new.fc_type,
             fl_in_raspis = :new.fl_in_raspis,fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put,
             FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
       WHERE fk_id = :old.fk_id;

        UPDATE TNAZGROUP
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, FD_DATE =:NEW.FD_RUN
       WHERE FK_NAZID = :old.fk_id;
       IF (:OLD.FK_NAZSOSID = :NEW.FK_NAZSOSID) AND (:OLD.FD_RUN <> :NEW.FD_RUN) AND (:OLD.FK_NAZSOSID <> ASU.GET_VIPNAZ)  THEN
          UPDATE TNAZGROUP
          SET FD_RUN = :NEW.FD_RUN
          WHERE FK_NAZID = :OLD.FK_ID;
       END IF;


  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise;
end;
    END;
  END IF;
END;
/
SHOW ERRORS;


--
-- TNAZIS_BEFORE_INSERT_AN  (Trigger) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE OR REPLACE TRIGGER ASU.TNAZIS_BEFORE_INSERT_AN
 BEFORE
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  -- запись ACCESSIONNUMBER
  if trim(:new.fc_accessionnumber) is null then
    select to_char(MED.SEQ_TANNMBSTR.NEXTVAL) into :new.fc_accessionnumber from dual;
  end if;
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END;
/
SHOW ERRORS;


DROP SYNONYM BUH.TNAZIS
/

--
-- TNAZIS  (Synonym) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE SYNONYM BUH.TNAZIS FOR ASU.TNAZIS
/


DROP SYNONYM STAT.TNAZIS
/

--
-- TNAZIS  (Synonym) 
--
--  Dependencies: 
--   TNAZIS (Table)
--
CREATE SYNONYM STAT.TNAZIS FOR ASU.TNAZIS
/


-- 
-- Non Foreign Key Constraints for Table TNAZIS 
-- 
ALTER TABLE ASU.TNAZIS ADD (
  CONSTRAINT FK_TNAZIS_CON
 PRIMARY KEY
 (FK_ID))
/

