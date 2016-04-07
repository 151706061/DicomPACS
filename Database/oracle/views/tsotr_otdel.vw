DROP VIEW ASU.TSOTR_OTDEL
/

/* Formatted on 06.04.2016 15:19:00 (QP5 v5.115.810.9015) */
--
-- TSOTR_OTDEL  (View)
--
--  Dependencies:
--   TSOTR (Synonym)
--   TOTDEL (Synonym)
--   GET_PRIMARY_OTDELID (Function)
--   TS_SPRAV (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.TSOTR_OTDEL
(
   FK_ID,
   FK_OWNERID,
   FC_FAM,
   FC_IM,
   FC_OTCH
)
AS
       SELECT   "FK_ID",
                "FK_OWNERID",
                "FC_FAM",
                "FC_IM",
                "FC_OTCH"
         FROM   (SELECT   o.fk_id,
                          o.fk_ownerid,
                          o.FC_NAME AS FC_FAM,
                          NULL AS FC_IM,
                          NULL AS FC_OTCH
                   FROM   asu.TOtdel o
                  WHERE   o.fl_del = 0
                 UNION ALL
                 SELECT   s.fk_id,
                          s.fk_otdelid AS fk_ownerid,
                          S.FC_FAM AS FC_FAM,
                          S.FC_NAME AS FC_IM,
                          S.FC_OTCH
                   FROM   asu.tsotr s, asu.ts_sprav sp
                  WHERE   s.fl_del = 0 AND sp.fk_id = s.fk_spravid) T
   CONNECT BY   PRIOR FK_ID = FK_OWNERID
   START WITH   FK_ID = ASU.Get_Primary_Otdelid
/


