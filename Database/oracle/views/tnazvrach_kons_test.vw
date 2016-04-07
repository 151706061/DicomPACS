DROP VIEW ASU.TNAZVRACH_KONS_TEST
/

/* Formatted on 06.04.2016 15:18:54 (QP5 v5.115.810.9015) */
--
-- TNAZVRACH_KONS_TEST  (View)
--
--  Dependencies:
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TSMID (Table)
--   GET_FULLMKB10 (Function)
--   GET_KONSID (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.TNAZVRACH_KONS_TEST
(
   FK_ID,
   FK_SOTRID,
   FK_KABINETID,
   FL_PRIEM,
   FK_SMID,
   FN_DOSTUP,
   FK_SOTRKABID,
   FN_PODPIS,
   FN_ACCESS,
   FN_NORMPROC
)
AS
   SELECT   tvn.fk_id_ fk_id,
            tv.fk_sotrid,
            tv.fk_kabinetid,
            tv.fl_default fl_priem,
            tvn.fk_smid,
            tvn.fn_dostup,
            tvn.fk_sotrkabid,
            tvn.fn_podpis,
            tvn.fn_access,
            0 fn_normproc
     FROM   asu.tvrachkab tv,
            asu.tvrachkab_naz tvn,
            (    SELECT   *
                   FROM   (SELECT   FK_ID, FK_OWNER
                             FROM   ASU.TSMID
                            WHERE   FL_SHOWANAL = 1) TSS
             CONNECT BY   PRIOR FK_ID = FK_OWNER
             START WITH   FK_ID = ASU.Get_Konsid) TSM
    WHERE   tv.fk_id = tvn.fk_sotrkabid AND TSM.FK_ID = tvn.FK_SMID
/


