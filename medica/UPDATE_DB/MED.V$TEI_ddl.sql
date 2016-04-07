-- Start of DDL Script for View MED.V$TEI
-- Generated 2-мар-2009 11:48:32 from MED@H081226

CREATE OR REPLACE VIEW med.v$tei (
   eiid,
   fc_name,
   fc_okei,
   fk_rlsdrugform,
   fl_xxx,
   fk_pharm,
   fc_fullname,
   fk_sklad_id )
AS
select "EIID","FC_NAME","FC_OKEI","FK_RLSDRUGFORM","FL_XXX","FK_PHARM","FC_FULLNAME","FK_SKLAD_ID" from med.tei
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(fk_sklad_id is null)or(fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TEI

