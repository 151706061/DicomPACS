DROP VIEW ASU.TNAZVRACH
/

/* Formatted on 06.04.2016 15:18:56 (QP5 v5.115.810.9015) */
--
-- TNAZVRACH  (View)
--
--  Dependencies:
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.TNAZVRACH
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
     FROM   tvrachkab tv, tvrachkab_naz tvn
    WHERE   tv.fk_id = tvn.fk_sotrkabid
/


DROP SYNONYM STAT.TNAZVRACH
/

--
-- TNAZVRACH  (Synonym) 
--
--  Dependencies: 
--   TNAZVRACH (View)
--
CREATE SYNONYM STAT.TNAZVRACH FOR ASU.TNAZVRACH
/


