DROP VIEW ASU.WEB_SOTR_SHOWONSITE
/

/* Formatted on 06.04.2016 15:19:32 (QP5 v5.115.810.9015) */
--
-- WEB_SOTR_SHOWONSITE  (View)
--
--  Dependencies:
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TRASPIS (Table)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSSPECID (Function)
--   GET_PROCID (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.WEB_SOTR_SHOWONSITE
(
   FK_ID,
   SHOWONSITE
)
AS
   SELECT   vkn.fk_id, R.FL_SHOW AS SHOWONSITE
     FROM   asu.traspis r,
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
    WHERE       r.fk_nazvrachid = vk.fk_id
            AND vk.fk_id = vkn.fk_sotrkabid
            AND vkn.fk_smid = sm_naz.fk_id
/


