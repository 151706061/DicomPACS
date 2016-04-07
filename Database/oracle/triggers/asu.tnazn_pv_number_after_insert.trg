DROP TRIGGER ASU.TNAZN_PV_NUMBER_AFTER_INSERT
/

--
-- TNAZN_PV_NUMBER_AFTER_INSERT  (Trigger) 
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


