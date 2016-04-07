ALTER TABLE MED.TTREB_DPC 
 ADD (
  FK_NAZMEDLECH_ID NUMBER DEFAULT -1
 )
/
COMMENT ON COLUMN MED.TTREB_DPC.FK_DPCID IS 'Ссылка на Tdpc (для связи Затребовано-Отпущено) - не используется Voronov 29.05.2008'
/
COMMENT ON COLUMN MED.TTREB_DPC.FK_NAZMEDLECH_ID IS 'ссылка на asu.tnazmedlech.FK_ID для связи 1:М'
/

--обновление связей между назначениями и требованиями
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

