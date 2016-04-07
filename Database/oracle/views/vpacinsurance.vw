DROP VIEW ASU.VPACINSURANCE
/

/* Formatted on 06.04.2016 15:19:13 (QP5 v5.115.810.9015) */
--
-- VPACINSURANCE  (View)
--
--  Dependencies:
--   TCOMPANY (Table)
--   TPAC_INSURANCE (Table)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--   TINSUR_DOGOVOR (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VPACINSURANCE
(
   FK_ID,
   FK_PEPLID,
   FK_TYPEDOCID,
   FC_TYPEDOC,
   FC_SER,
   FC_NUM,
   FD_BEGIN,
   FD_END,
   FK_COMPANYID,
   FC_COMPANY,
   FK_DOGOVORID
)
AS
   SELECT   idc.fk_id,
            idc.fk_peplid,
            idc.fk_typedocid,
            td.fc_name AS fc_typedoc,
            idc.fc_ser,
            idc.fc_num,
            idc.fd_begin,
            NVL (idc.fd_prolong, idc.fd_end) AS fd_end,
            idc.fk_companyid,
            NVL (TRIM (co.fc_short), 'Нет') AS fc_company,
            idc.fk_dogovorid
     FROM   asu.tinsur_dogovor idg,
            asu.tinsurdocs idc,
            asu.ttypedoc td,
            asu.tcompany co
    WHERE       idc.fk_typedocid = td.fk_id
            AND idc.fk_dogovorid = idg.fk_id
            AND idc.fk_companyid = co.fk_id(+)
   UNION
   --Для амбулаторных
   SELECT   idc.fk_id,
            pi.fk_pacid,
            idc.fk_typedocid,
            td.fc_name,
            idc.fc_ser,
            idc.fc_num,
            idc.fd_begin,
            NVL (idc.fd_prolong, idc.fd_end),
            idc.fk_companyid,
            NVL (TRIM (co.fc_short), 'Нет'),
            NULL
     FROM   asu.tpac_insurance pi,
            asu.tinsurdocs idc,
            asu.ttypedoc td,
            asu.tcompany co
    WHERE       idc.fk_typedocid = td.fk_id
            AND pi.fk_insurdocid = idc.fk_id
            AND idc.fk_companyid = co.fk_id(+)
/


