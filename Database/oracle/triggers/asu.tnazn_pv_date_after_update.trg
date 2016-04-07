DROP TRIGGER ASU.TNAZN_PV_DATE_AFTER_UPDATE
/

--
-- TNAZN_PV_DATE_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TNAZN_LINK_VNAZ (Table)
--   TNAZN_PV_DATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_DATE_AFTER_UPDATE" 
 AFTER
 UPDATE
 ON asu.tnazn_pv_date
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Declare
  v_VNAZ_ID integer;
  v_TYPE varchar(100);
begin
  -- ������������� �� ���������� TIB
  -- �������  ��� ��������������� VNAZ
  -- �������� ������ ������ �� �������!
  select count(*) into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  if v_VNAZ_ID=0 then
    Return;
  end if;
  select LV.FK_VNAZ into v_VNAZ_ID
  from TNAZN_LINK_VNAZ LV
  where  LV.fk_tnazn=:NEW.FK_NAZN;
  -- �� �������� ��� ��������� ���� �� ������������ ������!!!
  update TIB set
    FD_DATE=:NEW.FD
    ,FK_PACID=v_VNAZ_ID
    ,FK_SMEDITID=:NEW.FK_SMID
  where
    FK_PACID=v_VNAZ_ID
    and FK_SMEDITID=:NEW.FK_SMID;
end;
/
SHOW ERRORS;


