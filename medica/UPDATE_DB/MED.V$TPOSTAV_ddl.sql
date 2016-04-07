-- Start of DDL Script for View MED.V$TPOSTAV
-- Generated 26.11.2008 11:34:01 from MED@ASU

CREATE OR REPLACE VIEW med.v$tpostav (
   postavid,
   fc_name,
   fc_bossdolg,
   fc_bossfio,
   fl_del,
   fn_motype,
   fc_rekviziti,
   fk_sklad_id )
AS
SELECT p."POSTAVID",p."FC_NAME",p."FC_BOSSDOLG",p."FC_BOSSFIO",p."FL_DEL",p."FN_MOTYPE",p."FC_REKVIZITI",p."FK_SKLAD_ID"
  FROM med.tpostav p
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(p.fk_sklad_id is null)or(p.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TPOSTAV

