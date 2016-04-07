DROP TRIGGER ASU.TNAZKONS_UPDATE
/

--
-- TNAZKONS_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZKONS (Table)
--   TLASTNAZS (Table)
--   TRESKONS (Table)
--   GET_FIZIOTERAPEVT_KONS (Function)
--   GET_ISPOLZAVOTD (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
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


