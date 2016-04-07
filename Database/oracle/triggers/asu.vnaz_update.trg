DROP TRIGGER ASU.VNAZ_UPDATE
/

--
-- VNAZ_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   TNAZIS (Table)
--   TNAZKONS (Table)
--   TNAZLECH (Table)
--   TLASTNAZS (Table)
--   TRESKONS (Table)
--   TSMID (Table)
--   GET_ANALID (Function)
--   GET_FIZIOTERAPEVT_KONS (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_NEVIP (Function)
--   GET_NEYAV (Function)
--   GET_PROCID (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   TNEYAVKATERM (Table)
--   VNAZ (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_UPDATE" 
 BEFORE
 UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

DECLARE
  CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :new.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  CURSOR c2
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :old.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  nidnew   NUMBER;
  nidold   NUMBER;
  pCount   NUMBER;
  LastNazCount NUMBER;
  Lastdate date;
  LastKonsID number;
BEGIN

  if UPDATING ('FK_NAZSOSID') AND :old.FK_NAZSOSID <> :new.FK_NAZSOSID then
    UPDATE TPLAT_USLUG SET FP_SOS = :new.FK_NAZSOSID WHERE FK_NAZ = :new.fk_id;
    if :new.FK_NAZSOSID = GET_VIPNAZ then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 0, FL_AGREED = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
    if :new.FK_NAZSOSID = GET_NEVIP then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 1 WHERE FK_NAZ = :new.fk_id;
    end if;

    if :new.FK_NAZSOSID = GET_NEYAV and :new.FC_REMARK = 'Самозапись' then
     --проверяем, а есть ли такая запись уже в списке
     select count(1) into pCount from Tneyavkaterm where FK_NAZID = :new.FK_ID;
     if pCount = 0 then
      insert into Tneyavkaterm(FK_NAZID) values (:new.FK_ID) ;
     end if;
    ELSE
     DELETE from  Tneyavkaterm where FK_NAZID = :new.FK_ID;
    end if;

  end if;

  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  OPEN c1;
  OPEN c2;
  FETCH c1 INTO nidnew;
  FETCH c2 INTO nidold;
  CLOSE c1;
  CLOSE c2;
  IF nidnew <> nidold THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20002, '=oo?y???ou?  ?yo???o  y?o ??nuo?ou VNAZ');
  END IF;
  IF nidnew = get_issledid THEN
    UPDATE tnazis
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
  IF nidnew = get_konsid THEN
    UPDATE tnazkons
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
     
     --Если назначение выполнено
     ------ Begin сделано для кардиоцентра, на хантах этого пока нет 
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
     
     
     
  END IF;
  IF (nidnew = get_procid) THEN
    UPDATE tnazlech
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
  IF nidnew = get_analid THEN
    UPDATE tnazan
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
       UPDATE TNAZGROUP
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, FD_DATE =:NEW.FD_RUN
       WHERE FK_NAZID = :old.fk_id;
       if (:old.FK_NAZSOSID = :new.FK_NAZSOSID) and (:old.fd_run <> :new.fd_run) then
          UPDATE TNAZGROUP
          SET fd_run = :new.fd_run
          WHERE FK_NAZID = :old.fk_id;
       end if;
  insnaz.bins  := FALSE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20000, 'o?avu¬e eiuee-u? aeaaeo¬a-¬ ?ui?uiue?o--¬ e ue¬v-n¬ TSMID');
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;

    -- ORIGINAL TRIGGER BODY ENDS HERE
    END;
  END IF;
END;
/
SHOW ERRORS;


