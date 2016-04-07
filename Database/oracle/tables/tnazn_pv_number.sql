ALTER TABLE ASU.TNAZN_PV_NUMBER
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZN_PV_NUMBER CASCADE CONSTRAINTS
/

--
-- TNAZN_PV_NUMBER  (Table) 
--
--  Dependencies: 
--   TNAZN (Table)
--
CREATE TABLE ASU.TNAZN_PV_NUMBER
(
  FK_ID    INTEGER                              NOT NULL,
  FK_NAZN  INTEGER                              NOT NULL,
  FN       NUMBER                               NOT NULL,
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

COMMENT ON TABLE ASU.TNAZN_PV_NUMBER IS 'Значения параметра типа NUMBER
Author: Ura'
/

COMMENT ON COLUMN ASU.TNAZN_PV_NUMBER.FK_ID IS 'SEQUENCE=[SEQ_NAZN_PV]'
/

COMMENT ON COLUMN ASU.TNAZN_PV_NUMBER.FK_NAZN IS 'Ссылка на назначение'
/

COMMENT ON COLUMN ASU.TNAZN_PV_NUMBER.FN IS 'Значение типа NUMBER'
/

COMMENT ON COLUMN ASU.TNAZN_PV_NUMBER.FK_SMID IS 'ссылка на параметр в SMID'
/


--
-- IX_NAZN_PV_NUMBER_U  (Index) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE INDEX ASU.IX_NAZN_PV_NUMBER_U ON ASU.TNAZN_PV_NUMBER
(FK_NAZN)
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
-- PK_TNAZN_PV_NUMBER  (Index) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZN_PV_NUMBER ON ASU.TNAZN_PV_NUMBER
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
-- TNAZN_PV_NUMBER_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_BEFORE_UPDATE" 
 BEFORE
 UPDATE
 ON asu.tnazn_pv_number
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_LOINC_CODE integer;
  v_Count Integer;
  v_VNAZ_ID integer;
  v_TYPE varchar(100);
begin
  -- А теперь если это количественный признак процедур, то нужно пихать в TRESLECH
  select FK_LOINC_CODE into  v_LOINC_CODE from TSMID where FK_ID=:NEW.FK_SMID;
  if v_LOINC_CODE='-1' then
    -- это признак количества - нужно впихнуть результаты процедур
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
    -- сначала проверим есть ли выполненные процедуры
    select Count(*) into v_Count from TRESLECH R where R.fk_sos<>2 and R.fk_nazid=v_VNAZ_ID;
    if v_Count >0 then
      raise_application_Error(-20100,'Нельзя изменить количесство, т.к. существуют статусы результаты процедур');
      return;
    end if;
  end if;
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_NUMBER_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.tnazn_pv_number FOR EACH ROW
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
-- TNAZN_PV_NUMBER_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_AFTER_UPDATE" 
 AFTER
 UPDATE
 ON asu.tnazn_pv_number
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Declare
  v_VNAZ_ID integer;
  v_TYPE varchar(100);
  v_TNAZN_SMID integer;
  v_Pac_ID integer;
  v_VRACH_ID integer;
  v_count integer;
  v_LOINC_CODE integer;
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
  -- Нужно определить тип параметра и в зависимости от него пиахать
  select FC_TYPE into v_TYPE from TSMID
  where FK_ID=:NEW.FK_SMID;
  if (v_TYPE='VARCHAR2') or (v_TYPE='COMBOBOX') then
    update TIB set
      FK_SMID=:NEW.FN
     where
        FK_PACID=v_VNAZ_ID
      and FK_SMEDITID=:NEW.FK_SMID;
  else    -- всегда number
    update TIB set
      FN_NUM=:NEW.FN
     where
        FK_PACID=v_VNAZ_ID
      and FK_SMEDITID=:NEW.FK_SMID;
    -- если это количественный признак для процедур
    select FK_LOINC_CODE into  v_LOINC_CODE from TSMID where FK_ID=:NEW.FK_SMID;
    if v_LOINC_CODE='-1' then
        -- удаляем и заново создаем все -- а вот отсюда все лучше в after
        select Count(*) into v_Count from TRESLECH R where R.fk_nazid=v_VNAZ_ID;
        delete from TRESLECH R where R.fk_nazid=v_VNAZ_ID;
        select N.fk_smid,N.fk_creator
          into v_TNAZN_SMID, v_VRACH_ID
        from TNAZN N where N.fk_id=:NEW.FK_NAZN;
       -- еще нам нужен хитрый PAC_ID который DOC_ID
        select N.FK_PACID   into v_PAC_ID
        from VNAZ N where N.fk_id=v_VNAZ_ID;
        FOR v_I In 1..:NEW.FN LOOP
          insert into TRESLECH (FK_SMID,FK_PACID,FK_NAZID,FK_SOS,FD_INS)
          values (v_TNAZN_SMID,v_Pac_ID,v_VNAZ_ID,2,sysdate);
        END LOOP;
     end if;
  end if;
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_NUMBER_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_AFTER_INSERT" 
AFTER INSERT
ON asu.tnazn_pv_number
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Declare
  v_VNAZ_ID integer;
  v_TYPE varchar(100);
  v_LOINC_CODE integer;
  v_I integer;
  v_TNAZN_SMID integer;
  v_VRACH_ID integer;
  v_Pac_ID integer;
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
  -- Нужно определить тип параметра и в зависимости от него пиахать
  select FC_TYPE into v_TYPE from TSMID
  where FK_ID=:NEW.FK_SMID;
  if v_TYPE='VARCHAR2' then
    insert into TIB (FK_SMID,FK_PACID,FK_SMEDITID)
    values (:NEW.FN,v_VNAZ_ID,:NEW.FK_SMID);
  elsif v_TYPE='COMBOBOX' then
    insert into TIB (FK_SMID,FK_PACID,FK_SMEDITID)
    values (:NEW.FN,v_VNAZ_ID,:NEW.FK_SMID);
  elsif v_TYPE='NUMBER' then
    insert into TIB (FN_NUM,FK_SMID,FK_PACID,FK_SMEDITID)
    values (:NEW.FN,:NEW.FK_SMID,v_VNAZ_ID,:NEW.FK_SMID);
  end if;
-- А теперь если это количественный признак процедур, то нужно пихать в TRESLECH
  select FK_LOINC_CODE into  v_LOINC_CODE from TSMID where FK_ID=:NEW.FK_SMID;
  if v_LOINC_CODE='-1' then
    -- это признак количества - нужно впихнуть результаты процедур
    select N.fk_smid,N.fk_creator
      into v_TNAZN_SMID, v_VRACH_ID
    from TNAZN N where N.fk_id=:NEW.FK_NAZN;
   -- еще нам нужен хитрый PAC_ID который DOC_ID
    select N.FK_PACID   into v_PAC_ID
    from VNAZ N where N.fk_id=v_VNAZ_ID;
    FOR v_I In 1..:NEW.FN LOOP
      insert into TRESLECH (FK_SMID,FK_PACID,FK_NAZID,FK_SOS,FD_INS)
      values (v_TNAZN_SMID,v_Pac_ID,v_VNAZ_ID,2,sysdate);
    END LOOP;
  end if; --if v_LOINC_CODE='-1'
end;
/
SHOW ERRORS;


--
-- TNAZN_PV_NUMBER_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_AFTER_DELETE" 
AFTER  DELETE
ON asu.tnazn_pv_number
REFERENCING NEW AS NEW OLD AS OLD
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
  -- по хорошему проверить если это количественный признак процедуры, то удалить и их
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZN_PV_NUMBER 
-- 
ALTER TABLE ASU.TNAZN_PV_NUMBER ADD (
  CONSTRAINT PK_TNAZN_PV_NUMBER
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
-- Foreign Key Constraints for Table TNAZN_PV_NUMBER 
-- 
ALTER TABLE ASU.TNAZN_PV_NUMBER ADD (
  CONSTRAINT CK_TNAZN_PV_NUMBER__TNAZN 
 FOREIGN KEY (FK_NAZN) 
 REFERENCES ASU.TNAZN (FK_ID))
/

