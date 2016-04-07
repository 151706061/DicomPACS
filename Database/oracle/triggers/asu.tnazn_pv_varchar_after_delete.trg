DROP TRIGGER ASU.TNAZN_PV_VARCHAR_AFTER_DELETE
/

--
-- TNAZN_PV_VARCHAR_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TNAZN_LINK_VNAZ (Table)
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


