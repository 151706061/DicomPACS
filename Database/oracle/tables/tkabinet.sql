ALTER TABLE ASU.TKABINET
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKABINET CASCADE CONSTRAINTS
/

--
-- TKABINET  (Table) 
--
CREATE TABLE ASU.TKABINET
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FC_NAME      VARCHAR2(100 BYTE)               NOT NULL,
  FN_ORDER     NUMBER(3),
  FN_NORMANAZ  NUMBER,
  FN_NORMAUET  NUMBER,
  FC_PHONE     VARCHAR2(30 BYTE),
  FC_ADDRESS   VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          576K
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

COMMENT ON TABLE ASU.TKABINET IS 'Кбинеты мед учреждения'
/

COMMENT ON COLUMN ASU.TKABINET.FK_ID IS 'SEQUENCE=[SEQ_TKABINET]'
/

COMMENT ON COLUMN ASU.TKABINET.FC_NAME IS 'Наименование кабинета'
/

COMMENT ON COLUMN ASU.TKABINET.FN_ORDER IS 'Порядковый номер'
/

COMMENT ON COLUMN ASU.TKABINET.FC_PHONE IS 'Номер телефона кабинета'
/


--
-- TKABINET_ID_NAME  (Index) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE INDEX ASU.TKABINET_ID_NAME ON ASU.TKABINET
(FK_ID, FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKABINET_NAME  (Index) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE INDEX ASU.TKABINET_NAME ON ASU.TKABINET
(FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKABINET_LOG  (Trigger) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABINET_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TKABINET  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TKABINET', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TKABINET', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_name), null, :old.fk_id);
  end if;
  null;
END TKABINET_LOG;
/
SHOW ERRORS;


--
-- TKABINET_DELETE  (Trigger) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABINET_DELETE" 
  BEFORE DELETE
  ON ASU.TKABINET   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
declare
cursor c1 is select 'Есть' from dual where exists (select fk_id from tnazvrach where fk_kabinetid = :old.fk_id);
cursor c2 is select 'Есть' from dual where exists (select fc_name from vnaz where fk_roomid = :old.fk_id);
Begin
  open c1;
  if not c1%notfound then
    raise_application_error(-20001, 'В таблице мест проведения назначений имеются ссылки на этот кабинет! Этот кабинет не может быть удален.');
    close c1;
    return;
  end if;
  open c2;
  if not c2%notfound then
    raise_application_error(-20001, 'В этом кабинете уже проводились назначения! Этот кабинет не может быть удален.');
    close c2;
    return;
  end if;
End;
/
SHOW ERRORS;


--
-- TKABINET_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABINET_BEFOR_INSERT" 
  BEFORE INSERT
  ON ASU.TKABINET   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TKABINET.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


DROP SYNONYM STAT.TKABINET
/

--
-- TKABINET  (Synonym) 
--
--  Dependencies: 
--   TKABINET (Table)
--
CREATE SYNONYM STAT.TKABINET FOR ASU.TKABINET
/


-- 
-- Non Foreign Key Constraints for Table TKABINET 
-- 
ALTER TABLE ASU.TKABINET ADD (
  CONSTRAINT PK_TKABINET_CON
 PRIMARY KEY
 (FK_ID))
/

