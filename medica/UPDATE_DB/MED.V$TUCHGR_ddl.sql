-- Start of DDL Script for View MED.V$TUCHGR
-- Generated 8-окт-2010 9:23:12 from MED@H100609

CREATE OR REPLACE VIEW med.v$tuchgr (
   rid,
   fc_uchgr,
   uchgrid,
   fl_mat,
   fk_pharm,
   fk_sklad_id,
   fc_quota_code_2,
   PARENTID )
AS
SELECT ug.rowid as rid, ug."FC_UCHGR",ug."UCHGRID",ug."FL_MAT",ug."FK_PHARM",ug."FK_SKLAD_ID", ug.fc_quota_code_2, ug.PARENTID
  FROM med.tuchgr ug
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(ug.fk_sklad_id is null)or(ug.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TUCHGR

