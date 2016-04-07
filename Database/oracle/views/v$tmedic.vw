DROP VIEW ASU.V$TMEDIC
/

/* Formatted on 06.04.2016 15:19:23 (QP5 v5.115.810.9015) */
--
-- V$TMEDIC  (View)
--
--  Dependencies:
--   TCROSS_TABLE_CHECK (Table)
--   TCROSS_TABLE_PARAMS (Table)
--   TMEDIC (Table)
--   PKG_MEDSES (Package)
--

CREATE OR REPLACE FORCE VIEW ASU.V$TMEDIC
(
   FC_NAME,
   EIID,
   FARMGRID,
   UCHGRID,
   MEDICID,
   LEVELID,
   FC_COMMENT,
   FL_PKU,
   FK_NOMEN_RLS,
   FC_EANCODE,
   FK_TYPE,
   FK_PAYTYPE,
   FN_FPACKINUPACK,
   FK_FPACKID,
   FN_MASS,
   FK_MASSUNITS,
   FC_NAME_LAT,
   FL_LGOTA,
   FL_VISIBLE,
   FL_PRINT_LAT_NAME,
   FK_PHARM,
   FARMGRID2,
   FARMGRID3,
   FC_INTERNATIONAL_NAME,
   FL_VISIBLE_FOR_NOT_APTEKA,
   FK_SKLAD_ID,
   FL_EQUIPMENT,
   "fc_quota_code_234",
   FC_QUOTA_CODE_34
)
AS
   SELECT   m."FC_NAME",
            m."EIID",
            m."FARMGRID",
            m."UCHGRID",
            m."MEDICID",
            m."LEVELID",
            m."FC_COMMENT",
            m."FL_PKU",
            m."FK_NOMEN_RLS",
            m."FC_EANCODE",
            m."FK_TYPE",
            m."FK_PAYTYPE",
            m."FN_FPACKINUPACK",
            m."FK_FPACKID",
            m."FN_MASS",
            m."FK_MASSUNITS",
            m."FC_NAME_LAT",
            m."FL_LGOTA",
            m."FL_VISIBLE",
            m."FL_PRINT_LAT_NAME",
            m."FK_PHARM",
            m."FARMGRID2",
            m."FARMGRID3",
            m."FC_INTERNATIONAL_NAME",
            m."FL_VISIBLE_FOR_NOT_APTEKA",
            m."FK_SKLAD_ID",
            m."FL_EQUIPMENT",
            '00' || m.fc_quota_code_34 AS "fc_quota_code_234",
            m.fc_quota_code_34
     FROM   med.tmedic m,
            (SELECT   c.*, p.*
               FROM   med.tcross_table_check c, med.tcross_table_params p
              WHERE       (c.fk_key2 = med.pkg_medses.get_cur_mogroup)
                      AND (c.fk_cross_params_id = p.fk_id)
                      AND p.fc_synonim = 'ASSORT_TUCHGR_TMO_GROUP') cp
    WHERE   (   (med.pkg_medses.get_isusesklad = 0)
             OR (m.fk_sklad_id IS NULL)
             OR (m.fk_sklad_id = med.pkg_medses.get_cur_mo_sklad_id))
            AND (m.UCHGRID = cp.fk_key1(+))
            AND (NVL (cp.fn_value, 1) = 1)
/


