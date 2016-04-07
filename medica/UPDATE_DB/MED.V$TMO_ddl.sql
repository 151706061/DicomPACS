-- Start of DDL Script for View MED.V$TMO
-- Generated 25.11.2008 16:34:43 from MED@ASU

CREATE OR REPLACE VIEW med.v$tmo (
   moid,
   fc_name,
   fl_crm,
   fk_parent,
   fk_sotrid,
   fl_treb,
   fn_motype,
   fn_group,
   fk_curmogroupid,
   fk_sklad_id )
AS
(/* Formatted on 2008/11/25 16:29 (Formatter Plus v4.8.7) */
SELECT m."MOID", m."FC_NAME", m."FL_CRM", m."FK_PARENT", m."FK_SOTRID",
       m."FL_TREB", m."FN_MOTYPE", m."FN_GROUP", m."FK_CURMOGROUPID",
       m."FK_SKLAD_ID"
  FROM med.tmo m
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(m.fk_sklad_id is null)or(m.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
)
/


-- End of DDL Script for View MED.V$TMO

