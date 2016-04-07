DROP VIEW ASU.VPASS
/

/* Formatted on 06.04.2016 15:19:14 (QP5 v5.115.810.9015) */
--
-- VPASS  (View)
--
--  Dependencies:
--   TSPEC (Table)
--   TPASS (Table)
--   DO_VRACHFIO (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.VPASS
(
   FC_PASS,
   FC_VRACH,
   FC_NAME,
   FK_SPECID,
   FK_SOTRID
)
AS
   SELECT   fc_pass,
            do_vrachfio (fk_sotrid) AS fc_vrach,
            tspec.fc_name,
            fk_specid,
            fk_sotrid
     FROM   tpass, tspec
    WHERE   tpass.fk_specid = tspec.fk_id
/


