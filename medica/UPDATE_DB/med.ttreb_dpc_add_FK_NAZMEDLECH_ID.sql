ALTER TABLE MED.TTREB_DPC 
 ADD (
  FK_NAZMEDLECH_ID NUMBER DEFAULT -1
 )
/
COMMENT ON COLUMN MED.TTREB_DPC.FK_DPCID IS '������ �� Tdpc (��� ����� �����������-��������) - �� ������������ Voronov 29.05.2008'
/
COMMENT ON COLUMN MED.TTREB_DPC.FK_NAZMEDLECH_ID IS '������ �� asu.tnazmedlech.FK_ID ��� ����� 1:�'
/

--���������� ������ ����� ������������ � ������������
/*
select td.*,
NVL((select nml.FK_ID 
                             from asu.tnazmedlech nml
                             where nml.fk_treb_dpc = td.FK_ID),-1) as NML_ID
 from med.ttreb_dpc td
where td.FK_NAZMEDLECH_ID = -1 
*/                            

update med.ttreb_dpc td
  set td.FK_NAZMEDLECH_ID = NVL((select nml.FK_ID
                             from asu.tnazmedlech nml
                             where nml.fk_treb_dpc = td.FK_ID),-1)
where td.FK_NAZMEDLECH_ID = -1
/

commit
/

quit
/

