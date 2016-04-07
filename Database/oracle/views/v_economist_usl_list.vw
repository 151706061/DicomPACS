DROP VIEW ASU.V_ECONOMIST_USL_LIST
/

/* Formatted on 06.04.2016 15:19:04 (QP5 v5.115.810.9015) */
--
-- V_ECONOMIST_USL_LIST  (View)
--
--  Dependencies:
--   THEAL (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V_ECONOMIST_USL_LIST
(
   FK_ID,
   CODE,
   FC_NAME,
   FK_PARENT,
   FL_TMP,
   FP_HEALTYPE,
   FN_DLIT
)
AS
   SELECT   h.fk_id,
            h.code,
            h.fc_name,
            h.fk_parent,
            h.fl_tmp,
            h.fp_healtype,
            h.fn_dlit
     FROM   asu.theal h
    WHERE   h.code IN ('олс', 'олс-2009', 'галс', 'PL_NAL')
/


