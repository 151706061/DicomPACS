DROP VIEW ASU.VVRACHKAB_NAZ
/

/* Formatted on 06.04.2016 15:19:26 (QP5 v5.115.810.9015) */
--
-- VVRACHKAB_NAZ  (View)
--
--  Dependencies:
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TSMID (Table)
--   TSOTR (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VVRACHKAB_NAZ
(
   FK_ID,
   FK_SMID,
   FK_SOTRID,
   FC_SMID_NAME,
   FC_SMID_SYNONIM,
   FC_FAM,
   FC_NAME,
   FC_OTCH
)
AS
   SELECT   tmax.fk_id,
            tmax.fk_smid,
            tmax.fk_sotrid,
            tsm.fc_name fc_smid_name,
            tsm.fc_synonim fc_smid_synonim,
            ts.fc_fam,
            ts.fc_name,
            ts.fc_otch
     FROM            (  SELECT   MAX (tvkn.fk_id) fk_id,
                                 tvkn.fk_smid,
                                 tvk.fk_sotrid
                          FROM      asu.tvrachkab_naz tvkn
                                 LEFT JOIN
                                    asu.tvrachkab tvk
                                 ON tvk.fk_id = tvkn.fk_sotrkabid
                      GROUP BY   tvkn.fk_smid, tvk.fk_sotrid) tmax
                  LEFT JOIN
                     asu.tvrachkab_naz tvkn
                  ON tvkn.fk_id = tmax.fk_id
               LEFT JOIN
                  asu.tsmid tsm
               ON tsm.fk_id = tmax.fk_smid
            LEFT JOIN
               login.tsotr ts
            ON ts.fk_id = tmax.fk_sotrid
/


