DROP VIEW ASU.LASTDIAG_MAIN_PV
/

/* Formatted on 06.04.2016 15:18:52 (QP5 v5.115.810.9015) */
--
-- LASTDIAG_MAIN_PV  (View)
--
--  Dependencies:
--   TDIAG (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--

CREATE OR REPLACE FORCE VIEW ASU.LASTDIAG_MAIN_PV
(
   FK_PACID,
   FK_ID,
   FK_SMDIAGID,
   FL_FIRST,
   FK_DIAG_LAST,
   FK_MKB10
)
AS
   SELECT   td."FK_PACID",
            td."FK_ID",
            td."FK_SMDIAGID",
            td."FL_FIRST",
            td."FK_DIAG_LAST",
            tsd.fk_mkb10
     FROM      (SELECT   td.fk_pacid,
                         td.fk_id,
                         td.fk_smdiagid,
                         td.fl_first,
                         LAST_VALUE(td.fk_id)
                            OVER (
                               PARTITION BY td.fk_pacid
                               ORDER BY td.fd_date
                               ROWS BETWEEN UNBOUNDED PRECEDING
                               AND     UNBOUNDED FOLLOWING
                            )
                            fk_diag_last
                  FROM   asu.tdiag td
                 WHERE   td.fl_main = STAT.PKG_STATUTIL.get_smidid ('MAIN')
                         AND td.fp_type =
                               STAT.PKG_STATUTIL.get_smidid ('PRI_VYPISKE'))
               td
            INNER JOIN
               asu.tsmid tsd
            ON tsd.fk_id = td.fk_smdiagid
    WHERE   td.fk_id = td.fk_diag_last
/


