DROP VIEW ASU.VPEOPLES
/

/* Formatted on 06.04.2016 15:19:15 (QP5 v5.115.810.9015) */
--
-- VPEOPLES  (View)
--
--  Dependencies:
--   TAMBULANCE (Table)
--   TKARTA (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VPEOPLES
(
   FK_ID,
   FC_FAM,
   FC_IM,
   FC_OTCH,
   FD_ROJD,
   FP_SEX,
   FK_PEPLID
)
AS
   SELECT   fk_id,
            fc_fam,
            fc_im,
            fc_otch,
            fd_rojd,
            fp_sex,
            fk_peplid
     FROM   asu.tkarta
   UNION ALL
   SELECT   fk_id,
            fc_fam,
            fc_im,
            fc_otch,
            fd_rojd,
            fp_sex,
            fk_peplid
     FROM   asu.tambulance
/
COMMENT ON TABLE ASU.VPEOPLES IS 'Создана для того, чтобы заапдейтить пациентов на личностей (в рамках сопряжения с Мультивокс)
Created by Prihodko N. 11.05.2012'
/


GRANT SELECT ON ASU.VPEOPLES TO MULTIVOX
/

