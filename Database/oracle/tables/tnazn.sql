ALTER TABLE ASU.TNAZN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZN CASCADE CONSTRAINTS
/

--
-- TNAZN  (Table) 
--
--  Dependencies: 
--   TNAZN_STATUS (Table)
--
CREATE TABLE ASU.TNAZN
(
  FK_ID           NUMBER                        NOT NULL,
  FK_DOC_ID       NUMBER                        NOT NULL,
  FV_COMMENT      VARCHAR2(250 BYTE),
  FK_PAC_ID       NUMBER                        NOT NULL,
  FD_DATE_CREATE  DATE                          DEFAULT sysdate               NOT NULL,
  FK_STATUS       NUMBER                        NOT NULL,
  FK_CREATOR      NUMBER                        NOT NULL,
  FK_SMID         NUMBER                        NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TNAZN IS 'Назначения Author: Ura (use PKG_NAZN)'
/

COMMENT ON COLUMN ASU.TNAZN.FK_ID IS 'SEQUENCE=[SEQ_NAZN]'
/

COMMENT ON COLUMN ASU.TNAZN.FK_DOC_ID IS 'ссылка на документа'
/

COMMENT ON COLUMN ASU.TNAZN.FV_COMMENT IS 'Комментарии'
/

COMMENT ON COLUMN ASU.TNAZN.FK_PAC_ID IS 'Пациент TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TNAZN.FD_DATE_CREATE IS 'Дата создания '
/

COMMENT ON COLUMN ASU.TNAZN.FK_STATUS IS 'Статус'
/

COMMENT ON COLUMN ASU.TNAZN.FK_CREATOR IS 'Кто создал, ссылка на врача'
/

COMMENT ON COLUMN ASU.TNAZN.FK_SMID IS 'Тип назначения из TSMID'
/


--
-- PK_TNAZN  (Index) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZN ON ASU.TNAZN
(FK_ID)
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
-- TNAZN_BY_DOCID  (Index) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE INDEX ASU.TNAZN_BY_DOCID ON ASU.TNAZN
(FK_DOC_ID)
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
-- TNAZN_BY_PEPLID  (Index) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE INDEX ASU.TNAZN_BY_PEPLID ON ASU.TNAZN
(FK_PAC_ID)
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
-- TNAZN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN
    if :new.FK_ID is null then
      select SEQ_NAZN.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


--
-- TNAZN_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_BEFORE_DELETE" 
 BEFORE
 DELETE
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_ID_LINK integer;
  v_ID_VNAZ integer;
begin
  -- синхронизация с VNAZ
  Select count(*) into v_ID_LINK from TNAZN_LINK_VNAZ where FK_TNAZN= :OLD.FK_ID;
  if  v_ID_LINK=0 then
    Return;
  end if;
  Select FK_VNAZ  into v_ID_VNAZ from TNAZN_LINK_VNAZ where FK_TNAZN= :OLD.FK_ID;
  -- сначала линк
  delete from  TNAZN_LINK_VNAZ where FK_TNAZN=:OLD.FK_ID;
  delete from TRESLECH R where R.fk_nazid=v_ID_VNAZ; -- возможные результаты
  Delete from VNAZ where FK_ID=v_ID_VNAZ;
end;
/
SHOW ERRORS;


--
-- TNAZN_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_AFTER_UPDATE" 
 AFTER
 UPDATE
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_Root_SMID integer;
  v_ID_VNAZ integer;
  v_Status Integer;
  v_KARTA_ID INTEGER;
begin
  -- сначала найдем код VNAZ
  select FK_VNAZ into v_ID_VNAZ from TNAZN_LINK_VNAZ where FK_TNAZN=:NEW.FK_ID;
  --2004.03.30
    --  В PAC_ID оказывается надо записывать AMBULANCE_ID, который берется из TDOC.fk_kart_id
    -- А в docid нужно docid
  SELECT FK_KARTAID INTO v_KARTA_ID FROM TDOC WHERE fk_id=:NEW.FK_DOC_ID;
  -- Перобразуем статус
  select Decode(:new.FK_STATUS,1,GET_NEVIP,2,GET_VIPNAZ,3,GET_NEYAV,4,GET_NEVIP,5,GET_NEVIP) into v_Status from dual;
  UPDATE  VNAZ A
  SET
   A.FK_SMID = :NEW.FK_SMID
   , A.FC_REMARK = :new.FV_COMMENT
   , A.FD_NAZ = :NEW.FD_DATE_CREATE
   , A.FD_RUN = :NEW.FD_DATE_CREATE
   , A.FK_PACID = v_KARTA_ID
   , A.FK_DOCID=:NEW.FK_DOC_ID
   , A.FK_NAZSOSID = v_Status
   , A.FK_VRACHID = :NEW.FK_CREATOR
  where FK_ID=v_ID_VNAZ;
end;
/
SHOW ERRORS;


--
-- TNAZN_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_AFTER_INSERT" 
 AFTER
 INSERT
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_Root_SMID integer;
  v_ID integer;
  v_Status Integer;
  v_KARTA_ID INTEGER;
begin
  --DBMS_OUTPUT.put_line(TO_CHAR(:new.FK_ID));
  -- Перобразуем статус
  select Decode(:new.FK_STATUS,1,GET_NEVIP,2,GET_VIPNAZ,3,GET_NEYAV,4,GET_NEVIP,5,GET_NEVIP) into v_Status from dual;
  -- синхронизация на VNAZ
  --2004.01.30
  --  В PAC_ID оказывается надо записывать DOC_ID
  --2004.03.30
    --  В PAC_ID оказывается надо записывать AMBULANCE_ID, который берется из TDOC.fk_kart_id
    -- А в docid нужно docid
  SELECT FK_KARTAID INTO v_KARTA_ID FROM TDOC WHERE fk_id=:NEW.FK_DOC_ID;
  INSERT INTO  VNAZ
    ( FK_SMID , FC_REMARK , FD_NAZ , FD_RUN, FK_PACID ,  FK_NAZSOSID,FK_VRACHID,fk_docid )
  VALUES( :new.FK_SMID, :new.FV_COMMENT,:NEW.FD_DATE_CREATE, :NEW.FD_DATE_CREATE, v_KARTA_ID, v_Status,:NEW.FK_CREATOR,:NEW.FK_DOC_ID)
  Return FK_ID into  v_ID;
  -- Теперь в таблицу линков
  INSERT INTO  ASU.TNAZN_LINK_VNAZ   ( FK_TNAZN , FK_VNAZ )
  VALUES( :new.FK_ID, v_ID ) ;
  Return; -- остальная часть как заготовка на будующее
  v_Root_SMID:=PKG_SMID.getrootlevelid(:new.FK_SMID);
  IF v_Root_SMID = get_issledid
  THEN -- исследования
    Return;
  ELSIF v_Root_SMID = get_konsid
  THEN  -- консультации
    Return;
  ELSIF v_Root_SMID =  get_analid
  THEN  -- консультации
    Return;
  ELSIF v_Root_SMID =  get_procid
  THEN -- анализы
    Return;
  END IF;
--  Errors handling
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZN 
-- 
ALTER TABLE ASU.TNAZN ADD (
  CONSTRAINT PK_TNAZN
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TNAZN 
-- 
ALTER TABLE ASU.TNAZN ADD (
  CONSTRAINT CK_TNAZN__TNAZN_ST 
 FOREIGN KEY (FK_STATUS) 
 REFERENCES ASU.TNAZN_STATUS (FK_ID))
/

