DROP VIEW ASU.VRASPIS
/

/* Formatted on 06.04.2016 15:19:19 (QP5 v5.115.810.9015) */
--
-- VRASPIS  (View)
--
--  Dependencies:
--   TRASPIS (Table)
--   TRASPIS_SCHEMA (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VRASPIS
(
   RN,
   FK_ID,
   FK_SCHEMAID,
   FK_NAZVRACHID,
   FD_DATE,
   FK_GRAPHID,
   FL_SHOW
)
AS
   SELECT   "RN",
            "FK_ID",
            "FK_SCHEMAID",
            "FK_NAZVRACHID",
            "FD_DATE",
            "FK_GRAPHID",
            "FL_SHOW"
     FROM   (SELECT   ROW_NUMBER ()
                         OVER (PARTITION BY FK_NAZVRACHID
                               ORDER BY FK_SCHEMAID)
                         AS RN,
                      T.*
               FROM   (SELECT   t.fk_id,
                                -1 AS FK_SCHEMAID,
                                t.fk_nazvrachid,
                                t.fd_date,
                                t.fk_graphid,
                                t.fl_show
                         FROM   ASU.Traspis t
                       UNION
                       SELECT   ts.fk_id,
                                ts.FK_SCHEMAID,
                                ts.fk_nazvrachid,
                                ts.fd_date,
                                ts.fk_graphid,
                                -1 AS fl_show
                         FROM   ASU.Traspis_schema ts) T) T1
    WHERE   T1.RN = 1
/


