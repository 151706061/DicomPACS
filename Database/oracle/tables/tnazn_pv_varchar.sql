ALTER TABLE ASU.TNAZN_PV_VARCHAR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZN_PV_VARCHAR CASCADE CONSTRAINTS
/

--
-- TNAZN_PV_VARCHAR  (Table) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE TABLE ASU.TNAZN_PV_VARCHAR
(
  FK_ID    INTEGER                              NOT NULL,
  FK_NAZN  INTEGER                              NOT NULL,
  FV       VARCHAR2(4000 BYTE),
  FK_SMID  INTEGER                              NOT NULL
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

COMMENT ON TABLE ASU.TNAZN_PV_VARCHAR IS 'Значения параметра типа VARCHAR2
Author: Ura'
/

COMMENT ON COLUMN ASU.TNAZN_PV_VARCHAR.FK_ID IS 'SEQUENCE=[SEQ_NAZN_PV]'
/

COMMENT ON COLUMN ASU.TNAZN_PV_VARCHAR.FK_NAZN IS 'Ссылка на назначение'
/

COMMENT ON COLUMN ASU.TNAZN_PV_VARCHAR.FV IS 'Значение типа VARCHAR'
/

COMMENT ON COLUMN ASU.TNAZN_PV_VARCHAR.FK_SMID IS 'ссылка на параметр в SMID'
/


--
-- PK_TNAZN_PV_VARCHAR  (Index) 
--
--  Dependencies: 
--   TNAZN_PV_VARCHAR (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZN_PV_VARCHAR ON ASU.TNAZN_PV_VARCHAR
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
-- TNAZN_PV_VARCHAR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_VARCHAR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_VARCHAR_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.tnazn_pv_varchar FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_PV
    if :new.FK_ID is null then
      select SEQ_NAZN_PV.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_VARCHAR_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_VARCHAR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_VARCHAR_AFTER_UPDATE" 
 AFTER
 UPDATE
 ON asu.tnazn_pv_varchar
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Declare
  v_VNAZ_ID integer;
  v_TYPE varchar(100);
begin
  -- синхронизация со структурой TIB
  -- Сначала  код соответсующзего VNAZ
  -- Возможна ошибка данных не найдено!
  select count(*) into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  if v_VNAZ_ID=0 then
    Return;
  end if;
  select LV.FK_VNAZ into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  update TIB set
    FC_CHAR=:NEW.FV
   where
      FK_PACID=v_VNAZ_ID
    and FK_SMEDITID=:NEW.FK_SMID;
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_VARCHAR_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_VARCHAR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_VARCHAR_AFTER_INSERT" 
 AFTER
 INSERT
 ON asu.tnazn_pv_varchar
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Declare
  v_VNAZ_ID integer;
begin
  -- синхронизация со структурой TIB
  -- Сначала  код соответсующзего VNAZ
  -- Возможна ошибка данных не найдено!
  select count(*) into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  if v_VNAZ_ID=0 then
    Return;
  end if;
  select LV.FK_VNAZ into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  insert into TIB (FC_CHAR,FK_PACID,FK_SMEDITID,FK_SMID)
  values (:NEW.FV,v_VNAZ_ID,:NEW.FK_SMID,:NEW.FK_SMID);
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_VARCHAR_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_VARCHAR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_VARCHAR_AFTER_DELETE" 
 AFTER
 DELETE
 ON asu.tnazn_pv_varchar
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Declare
  v_VNAZ_ID integer;
begin
  -- синхронизация со структурой TIB
  -- Сначала  код соответсующзего VNAZ
  -- Возможна ошибка данных не найдено!
  select count(*) into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:OLD.FK_NAZN;
  if v_VNAZ_ID=0 then
    Return;
  end if;
  select LV.FK_VNAZ into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:OLD.FK_NAZN;
  delete from TIB where FK_PACID=v_VNAZ_ID  and FK_SMEDITID=:OLD.FK_SMID;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZN_PV_VARCHAR 
-- 
ALTER TABLE ASU.TNAZN_PV_VARCHAR ADD (
  CONSTRAINT PK_TNAZN_PV_VARCHAR
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
-- Foreign Key Constraints for Table TNAZN_PV_VARCHAR 
-- 
ALTER TABLE ASU.TNAZN_PV_VARCHAR ADD (
  CONSTRAINT CK_TNAZN_PV_VAR__TNAZN 
 FOREIGN KEY (FK_NAZN) 
 REFERENCES ASU.TNAZN (FK_ID))
/

