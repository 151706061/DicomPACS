DROP VIEW ASU.WEB_SCHEDULE_SHORT
/

/* Formatted on 06.04.2016 15:19:31 (QP5 v5.115.810.9015) */
--
-- WEB_SCHEDULE_SHORT  (View)
--
--  Dependencies:
--   TGRAPH (Table)
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TRASPIS (Table)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSSPECID (Function)
--   GET_PROCID (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.WEB_SCHEDULE_SHORT
(
   FK_ID,
   SHOWONSITE,
   NEED_TRANSFER
)
AS
   SELECT   g.fk_id,
            CASE WHEN (R.FL_SHOW = 1) AND (G.FL_SHOW = 1) THEN 1 ELSE 0 END
               AS SHOWONSITE,
            R.FL_SHOW AS NEED_TRANSFER
     FROM   asu.tgraph g,
            asu.traspis r,
            asu.tvrachkab vk,
            asu.tvrachkab_naz vkn,
            (    SELECT   TSS.FK_ID
                   FROM   (SELECT   TSS.FK_ID, TSS.FK_OWNER
                             FROM   ASU.TSMID TSS
                            WHERE   TSS.FL_SHOWANAL = 1 AND TSS.Fl_Del = 0) TSS
             START WITH   TSS.FK_ID IN
                                (ASU.GET_KONSSPECID,
                                 ASU.GET_ISSLEDID,
                                 ASU.GET_PROCID)
             CONNECT BY   PRIOR TSS.FK_ID = TSS.FK_OWNER) SM_NAZ
    WHERE       g.fk_raspid = r.fk_graphid
            AND r.fk_nazvrachid = vk.fk_id
            AND vk.fk_id = vkn.fk_sotrkabid
            AND vkn.fk_smid = sm_naz.fk_id
/


