-- Start of DDL Script for View MED.V$TMO_GROUP
-- Generated 27-фев-2010 15:45:35 from MED@h091003c

CREATE OR REPLACE VIEW med.v$tmo_group (
   groupid,
   fc_group,
   fl_del,
   fk_sklad_id,
   fc_quota_code_1 )
AS
SELECT mg."GROUPID",mg."FC_GROUP",mg."FL_DEL",mg."FK_SKLAD_ID", mg.fc_quota_code_1
  FROM med.tmo_group mg
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(mg.fk_sklad_id is null)or(mg.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TMO_GROUP

