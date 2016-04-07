DROP TRIGGER ASU.TNAZN_PV_VARCHAR_AFTER_INSERT
/

--
-- TNAZN_PV_VARCHAR_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TNAZN_LINK_VNAZ (Table)
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


