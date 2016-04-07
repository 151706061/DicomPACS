-- Start of DDL Script for View MED.V$TPRODCERT
-- Generated 26.11.2008 12:30:02 from MED@ASU

CREATE OR REPLACE VIEW med.v$tprodcert (
   fk_id,
   fn_parent,
   fc_value,
   fk_sklad_id )
AS
SELECT p."FK_ID",p."FN_PARENT",p."FC_VALUE",p."FK_SKLAD_ID"
  FROM med.tprodcert p
  where (med.PKG_MEDSES.get_IsUseSklad = 0)or(p.fk_sklad_id is null)or(p.fk_sklad_id = med.PKG_MEDSES.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TPRODCERT

