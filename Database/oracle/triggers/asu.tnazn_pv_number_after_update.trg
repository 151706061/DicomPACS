DROP TRIGGER ASU.TNAZN_PV_NUMBER_AFTER_UPDATE
/

--
-- TNAZN_PV_NUMBER_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TRESLECH (Table)
--   TNAZN (Table)
--   TNAZN_LINK_VNAZ (Table)
--   TNAZN_PV_NUMBER (Table)
--   TSMID (Table)
--   VNAZ (Table)
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


