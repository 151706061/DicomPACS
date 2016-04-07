DROP TRIGGER ASU.TNAZN_PV_NUMBER_BEFORE_UPDATE
/

--
-- TNAZN_PV_NUMBER_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TRESLECH (Table)
--   TNAZN_LINK_VNAZ (Table)
--   TNAZN_PV_NUMBER (Table)
--   TSMID (Table)
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
  -- � ������ ���� ��� �������������� ������� ��������, �� ����� ������ � TRESLECH
  select FK_LOINC_CODE into  v_LOINC_CODE from TSMID where FK_ID=:NEW.FK_SMID;
  if v_LOINC_CODE='-1' then
    -- ��� ������� ���������� - ����� �������� ���������� ��������
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
    -- ������� �������� ���� �� ����������� ���������
    select Count(*) into v_Count from TRESLECH R where R.fk_sos<>2 and R.fk_nazid=v_VNAZ_ID;
    if v_Count >0 then
      raise_application_Error(-20100,'������ �������� �����������, �.�. ���������� ������� ���������� ��������');
      return;
    end if;
  end if;
end;
/
SHOW ERRORS;


