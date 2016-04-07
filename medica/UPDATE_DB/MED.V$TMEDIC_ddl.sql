-- Start of DDL Script for View MED.V$TMEDIC
-- Generated 27-oaa-2010 15:46:15 from MED@h091003c
-- Start of DDL Script for View MED.V$TMEDIC
-- Generated 3-ia?-2010 12:23:42 from MED@ASU

CREATE OR REPLACE VIEW med.v$tmedic (
   fc_name,
   eiid,
   farmgrid,
   uchgrid,
   medicid,
   levelid,
   fc_comment,
   fl_pku,
   fk_nomen_rls,
   fc_eancode,
   fk_type,
   fk_paytype,
   fn_fpackinupack,
   fk_fpackid,
   fn_mass,
   fk_massunits,
   fc_name_lat,
   fl_lgota,
   fl_visible,
   fl_print_lat_name,
   fk_pharm,
   farmgrid2,
   farmgrid3,
   fc_international_name,
   fl_visible_for_not_apteka,
   fk_sklad_id,
   fl_equipment,
   fc_quota_code_234, fc_quota_code_34  )
AS
SELECT m."FC_NAME", m."EIID", m."FARMGRID", m."UCHGRID", m."MEDICID",
       m."LEVELID", m."FC_COMMENT", m."FL_PKU", m."FK_NOMEN_RLS",
       m."FC_EANCODE", m."FK_TYPE", m."FK_PAYTYPE", m."FN_FPACKINUPACK",
       m."FK_FPACKID", m."FN_MASS", m."FK_MASSUNITS", m."FC_NAME_LAT",
       m."FL_LGOTA", m."FL_VISIBLE", m."FL_PRINT_LAT_NAME", m."FK_PHARM",
       m."FARMGRID2", m."FARMGRID3", m."FC_INTERNATIONAL_NAME",
       m."FL_VISIBLE_FOR_NOT_APTEKA", m."FK_SKLAD_ID", m."FL_EQUIPMENT",
       '00'||m.fc_quota_code_34 as "fc_quota_code_234", m.fc_quota_code_34
  FROM med.tmedic m,
       (select c.*, p.* from med.tcross_table_check c, med.tcross_table_params p
        where (c.fk_key2 = med.pkg_medses.get_cur_mogroup) and
              (c.fk_cross_params_id = p.fk_id) and p.fc_synonim = 'ASSORT_TUCHGR_TMO_GROUP') cp

 WHERE ((med.pkg_medses.get_isusesklad = 0)
    OR (m.fk_sklad_id IS NULL)
    OR (m.fk_sklad_id = med.pkg_medses.get_cur_mo_sklad_id))
    and(m.UCHGRID = cp.fk_key1(+)) and (nvl(cp.fn_value,1) = 1)
/


-- End of DDL Script for View MED.V$TMEDIC
