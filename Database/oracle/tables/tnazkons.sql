ALTER TABLE ASU.TNAZKONS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZKONS CASCADE CONSTRAINTS
/

--
-- TNAZKONS  (Table) 
--
CREATE TABLE ASU.TNAZKONS
(
  FK_ID           NUMBER(15)                    NOT NULL,
  FK_SMID         NUMBER(15),
  FC_REMARK       VARCHAR2(4000 BYTE),
  FD_NAZ          DATE,
  FD_RUN          DATE,
  FK_ROOMID       NUMBER(9)                     DEFAULT 0,
  FK_ISPOLID      NUMBER(15)                    DEFAULT 0,
  FK_VRACHID      NUMBER(15),
  FK_NAZSOSID     NUMBER(15),
  FK_PACID        NUMBER(15),
  FK_RESULTID     NUMBER(15)                    DEFAULT -1,
  FC_NAME         VARCHAR2(100 BYTE),
  FL_PLAT         VARCHAR2(3 BYTE),
  FC_TYPE         VARCHAR2(20 BYTE),
  FL_INS          NUMBER(1),
  FL_IN_RASPIS    NUMBER(1)                     DEFAULT 0,
  FL_ISVRACHVIEW  NUMBER(1),
  FL_MORE_PUT     NUMBER(1)                     DEFAULT 0,
  FK_DOCID        NUMBER(15),
  FK_NAZTYPEID    NUMBER(15),
  FK_NAZOWNER     NUMBER(15)                    DEFAULT -1,
  FK_REASON       NUMBER,
  FK_PLACE        NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          13640K
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

COMMENT ON TABLE ASU.TNAZKONS IS 'Назначения консультаций
   '
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_SMID IS 'Код проводимой консультации'
/

COMMENT ON COLUMN ASU.TNAZKONS.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TNAZKONS.FD_NAZ IS 'Дата создания назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FD_RUN IS 'Дата регистрации/проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_VRACHID IS 'Код врача, проводившего исследования'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_NAZSOSID IS 'Состояние назначения(по справочнику TNAZSOS)'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_RESULTID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZKONS.FC_NAME IS 'Название назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FL_PLAT IS 'Признак необходимости оплаты назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FC_TYPE IS 'Тип назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FL_INS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZKONS.FL_IN_RASPIS IS 'Признак присутствия назначения в расписании'
/

COMMENT ON COLUMN ASU.TNAZKONS.FL_ISVRACHVIEW IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZKONS.FL_MORE_PUT IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_NAZOWNER IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_REASON IS 'select fk_id,fc_name, fc_synonim from asu.tsmid where fk_owner = (select fk_id from tsmid where fc_synonim=''AMBTALON_REASON'') and FL_DEL <> 1'
/

COMMENT ON COLUMN ASU.TNAZKONS.FK_PLACE IS 'select fk_id,fc_name from asu.tsmid where fk_owner = (select fk_id from asu.tsmid where fc_synonim=''AMBTALON_SERVPLACE'') and FL_DEL <> 1'
/


--
-- PK_TNAZKONS_CON  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZKONS_CON ON ASU.TNAZKONS
(FK_ID)
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
-- TNAZKONS_BY_DATA_PACID  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE UNIQUE INDEX ASU.TNAZKONS_BY_DATA_PACID ON ASU.TNAZKONS
(FK_PACID, FD_RUN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6272K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZKONS_DATE  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE INDEX ASU.TNAZKONS_DATE ON ASU.TNAZKONS
(FD_RUN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3712K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZKONS_FK_NAZSOS_PACID  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE UNIQUE INDEX ASU.TNAZKONS_FK_NAZSOS_PACID ON ASU.TNAZKONS
(FK_NAZSOSID, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5248K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZKONS_ISPOLID  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE INDEX ASU.TNAZKONS_ISPOLID ON ASU.TNAZKONS
(FK_ISPOLID, FK_ROOMID)
NOLOGGING
TABLESPACE INDX
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
-- TNAZKONS_RASPIS_SOS  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE INDEX ASU.TNAZKONS_RASPIS_SOS ON ASU.TNAZKONS
(FL_IN_RASPIS, FK_NAZSOSID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3968K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZKONS_SMID_INS  (Index) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE INDEX ASU.TNAZKONS_SMID_INS ON ASU.TNAZKONS
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3968K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZKONS_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZKONS_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TNAZKONS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


--
-- TNAZKONS_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZKONS_DELETE" 
BEFORE  DELETE  ON asu.TNAZKONS
REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
declare
 LastKonsID number;
 LastDate date;

Begin
 delete from tib where fk_pacid=:old.fk_id;
 delete from tresis where fk_nazid=:old.fk_id;
 if insnaz.bins then
   return;
 end if;
 insnaz.bins:=true;
 asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
 delete from vnaz where fk_id=:old.fk_id;
 delete from VRES where FK_NAZID = :old.FK_ID;
 delete from TresKons where FK_NAZID = :old.FK_ID;
 
 if :old.FK_NAZSOSID = ASU.GET_VIPNAZ then
  if :old.FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" then
   select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
   if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
    select FD_INS,FK_NAZID into LastDate, LastKonsID from (
     select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
      where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
      --Апдейтим значения 
        update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
   else
        update ASU.Tlastnazs SET FK_FIZIOKONSID = NULL, FD_FIZIOKONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
   end if; 
  else
   select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
   if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
    select FD_INS,FK_NAZID into LastDate, LastKonsID from (
     select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
      where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
      --Апдейтим значения 
        update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
   else
        update ASU.Tlastnazs SET FK_KONSID = NULL, FD_KONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
   end if; 
  end if;
 end if; 
 
 
 
 insnaz.bins:=false;

 exception
    when others then
        insnaz.bins:=false;
        raise;
End;
/
SHOW ERRORS;


--
-- TNAZKONS_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZKONS_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazkons
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
DECLARE
  nIspolID   NUMBER;
  LastNazCount NUMBER; 
  LastDate date;
  LastKonsID number;
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins := TRUE;
  nIspolID := get_ispolzavotd (:new.fk_smid, :new.fk_pacid);
  IF nIspolID > 0 THEN
    :new.fk_ispolid := nIspolID;
  END IF;
  SELECT SEQ_TKARTA.NEXTVAL
    INTO :NEW.FK_ID
    FROM DUAL;
  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);  
    INSERT INTO vnaz (fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview,fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  else
    INSERT INTO vnaz (fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview,fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,:new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  end if;
  ------ Begin сделано как для кардиоцентра 
     --Если назначение выполнено
     if (:new.fk_nazsosid = asu.Get_Vipnaz) then 
      -- Если это не физиотерапевт
      if (:new.FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") then
       --смотрим, есть ли уже выполненные консультации       
       --Проверяем, есть ли вообще записи на этого паца
       select count(1), max(FK_KONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_KONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_KONSID <> :new.FK_ID; 
       
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  
          ((LastNazCount = 0) and (LastDate is NULL)) ---Если еще ничего нету
           or 
          (LastDate < :new.FD_RUN) ---Если по дате проходит
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) -- Если запись на паца есть, но нет отметки о консультациях
       then
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_KONSID,FD_KONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        -- перед жтим проверив, а есть ли выполненные консультации Не фмзиотерапевта
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if; 
       end if;
      else
       --смотрим, есть ли уже выполненные консультации
       select count(1), max(FK_FIZIOKONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_FIZIOKONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_FIZIOKONSID <> :new.FK_ID; 
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  ((LastNazCount = 0) and (LastDate is NULL)) 
           or 
          (LastDate < :new.FD_RUN)
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) 
       then
         ---select count(1) into LastNazCount from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_FIZIOKONSID,FD_FIZIOKONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS"  and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if;
       end if; 
      end if;
    end if;   
   ------ end 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  insnaz.bins := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins := FALSE;
    raise;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


--
-- TNAZKONS_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZKONS_UPDATE" 
 BEFORE
  UPDATE
 ON asu.tnazkons
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
 LastNazCount number;
 LastKonsID number;


BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
DECLARE
  nIspolID   NUMBER;
  LastDate Date;
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  -- sam на консультацию зав. отделением
  nIspolID     := get_ispolzavotd (:new.fk_smid, :new.fk_pacid);
  IF     (nIspolID > 0)
     AND (:old.fk_ispolid IS NULL) THEN
    :new.fk_ispolid := nIspolID;
  END IF;

  --
  UPDATE vnaz
     SET fk_smid = :new.fk_smid,fc_remark = :new.fc_remark,fd_naz = :new.fd_naz,fd_run = :new.fd_run,fk_roomid = :new.fk_roomid,
         fk_ispolid = :new.fk_ispolid,fk_vrachid = :new.fk_vrachid,fk_nazsosid = :new.fk_nazsosid,fk_pacid = :new.fk_pacid,
         fk_resultid = :new.fk_resultid,fc_name = :new.fc_name,fl_plat = :new.fl_plat,fc_type = :new.fc_type,fl_in_raspis = :new.fl_in_raspis,
         fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put, FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
   WHERE fk_id = :old.fk_id;
   
    ------ Begin сделано для кардиоцентра, перенесено на ханты
     --Если назначение выполнено
     if (:new.fk_nazsosid = asu.Get_Vipnaz) then 
      -- Если это не физиотерапевт
      if (:new.FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") then
       --смотрим, есть ли уже выполненные консультации       
       --Проверяем, есть ли вообще записи на этого паца
       select count(1), max(FK_KONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_KONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_KONSID <> :new.FK_ID; 
       
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  
          ((LastNazCount = 0) and (LastDate is NULL)) ---Если еще ничего нету
           or 
          (LastDate < :new.FD_RUN) ---Если по дате проходит
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) -- Если запись на паца есть, но нет отметки о консультациях
       then
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_KONSID,FD_KONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        -- перед жтим проверив, а есть ли выполненные консультации Не фмзиотерапевта
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if; 
       end if;
      else
       --смотрим, есть ли уже выполненные консультации
       select count(1), max(FK_FIZIOKONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_FIZIOKONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_FIZIOKONSID <> :new.FK_ID; 
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  ((LastNazCount = 0) and (LastDate is NULL)) 
           or 
          (LastDate < :new.FD_RUN)
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) 
       then
         ---select count(1) into LastNazCount from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_FIZIOKONSID,FD_FIZIOKONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS"  and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if;
       end if; 
      end if;
    end if;   
  ------ end сделано для кардиоцентра, на хантах этого пока нет 
  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


DROP SYNONYM BUH.TNAZKONS
/

--
-- TNAZKONS  (Synonym) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE SYNONYM BUH.TNAZKONS FOR ASU.TNAZKONS
/


DROP SYNONYM STAT.TNAZKONS
/

--
-- TNAZKONS  (Synonym) 
--
--  Dependencies: 
--   TNAZKONS (Table)
--
CREATE SYNONYM STAT.TNAZKONS FOR ASU.TNAZKONS
/


-- 
-- Non Foreign Key Constraints for Table TNAZKONS 
-- 
ALTER TABLE ASU.TNAZKONS ADD (
  CONSTRAINT PK_TNAZKONS_CON
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

