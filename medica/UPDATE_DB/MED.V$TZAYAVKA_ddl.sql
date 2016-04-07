-- Start of DDL Script for View MED.V$TZAYAVKA
-- Generated 26.11.2008 11:34:57 from MED@ASU

CREATE OR REPLACE VIEW med.v$tzayavka (
   fk_zayavid,
   fc_zayav_num,
   fd_create,
   fd_invoice,
   fk_mo_create,
   fc_dover_num,
   fk_mo_get,
   fk_mo_zayav,
   fk_postavid,
   fd_dover_date,
   fc_comment,
   fk_sklad_id )
AS
SELECT z."FK_ZAYAVID", z."FC_ZAYAV_NUM", z."FD_CREATE", z."FD_INVOICE",
       z."FK_MO_CREATE", z."FC_DOVER_NUM", z."FK_MO_GET", z."FK_MO_ZAYAV",
       z."FK_POSTAVID", z."FD_DOVER_DATE", z."FC_COMMENT", z."FK_SKLAD_ID"
  FROM med.tzayavka z
 WHERE (med.pkg_medses.get_isusesklad = 0)
    OR (z.fk_sklad_id IS NULL)
    OR (z.fk_sklad_id = med.pkg_medses.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TZAYAVKA

