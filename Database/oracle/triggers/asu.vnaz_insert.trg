DROP TRIGGER ASU.VNAZ_INSERT
/

--
-- VNAZ_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TKARTA (Sequence)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   TNAZIS (Table)
--   TNAZKONS (Table)
--   TNAZLECH (Table)
--   TLASTNAZS (Table)
--   TRESKONS (Table)
--   TNAZOPL (Table)
--   TSMID (Table)
--   PKG_NAZ (Package)
--   GET_ANALID (Function)
--   GET_FIZIOTERAPEVT_KONS (Function)
--   GET_GROUPID_BY_SMID (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PROCID (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_INSERT" 
 BEFORE
 INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
DECLARE
  LastNazCount NUMBER;
  CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :new.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  nid   NUMBER;
  omsId NUMBER;
  LastDate date; 
  LastKonsID number;
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  SELECT seq_tkarta.nextval
    INTO :new.fk_id
    FROM dual;
--   raise_application_error(-20002, 'VNAZINSERT FK_ID='||:new.fk_id);
  OPEN c1;
  FETCH c1 INTO nid;
  CLOSE c1;
  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
  end if;
  IF nid = get_konsid THEN
    INSERT INTO tnazkons
            (fk_id, fk_smid, fc_remark, fd_naz,
             fd_run, fk_roomid, fk_ispolid, fk_vrachid,
             fk_nazsosid, fk_pacid, fk_resultid, fc_name,
             fl_plat, fc_type, fl_in_raspis,
             fl_isvrachview,
             fl_more_put,
             fk_naztypeid, FK_NAZOWNER
            )
     VALUES (:NEW.fk_id, :NEW.fk_smid, :NEW.fc_remark, :NEW.fd_naz,
             :NEW.fd_run, :NEW.fk_roomid, :NEW.fk_ispolid, :NEW.fk_vrachid,
             :NEW.fk_nazsosid, :NEW.fk_pacid, :NEW.fk_resultid, :NEW.fc_name,
             :NEW.fl_plat, :NEW.fc_type, :NEW.fl_in_raspis,
             :NEW.fl_isvrachview,
             pkg_naz.get_setplat (:NEW.fk_smid, :NEW.fk_pacid),
             :NEW.fk_naztypeid, :NEW.FK_NAZOWNER
            );
            
   ------ Begin сделано для кардиоцентра, на хантах этого пока нет              
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
  ------End сделано для кардиоцентра, на хантах этого пока нет             
            
            
  END IF;
  IF nid = get_issledid THEN
    INSERT INTO tnazis (fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
         VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
    INSERT INTO TNAZGROUP(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
      VALUES(:NEW.FK_ID, GET_GROUPID_BY_SMID(:NEW.FK_SMID), :NEW.FD_RUN, :NEW.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :NEW.FD_RUN);

  END IF;

  IF nid = get_procid THEN
    INSERT INTO tnazlech(fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview,fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
        VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview, :new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);

  END IF;
  IF nid = get_analid THEN
    INSERT INTO tnazan(fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
         VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
    INSERT INTO TNAZGROUP(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID,fd_date)
         VALUES(:NEW.FK_ID, GET_GROUPID_BY_SMID(:NEW.FK_SMID), :NEW.FD_RUN, :NEW.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID,:new.fd_run);
      -- Reference from TNAZAN to TNAZOPL
      SELECT FK_ID into omsId FROM TSMID WHERE FC_SYNONIM = 'TAL_OPLOMS';
      INSERT INTO TNAZOPL (FK_NAZID, FK_SMID_TAL_OPL) VALUES (:new.FK_ID, omsId);
  END IF;



  insnaz.bins  := FALSE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20000, 'Ўцрv·мш ъь·шъ-·ц фштфшЄмф-м ц·ьц·ь·ъцЎ--м ъ ·шмv-ём TSMID' || :new.fk_smid);
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


