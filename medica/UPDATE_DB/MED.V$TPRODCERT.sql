CREATE OR REPLACE VIEW MED.V$TPRODCERT AS
SELECT p."FK_ID",p."FN_PARENT",p."FC_VALUE",p."FK_SKLAD_ID", p.fl_foreighn
  FROM med.tprodcert p
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(p.fk_sklad_id is null)or(p.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id);
