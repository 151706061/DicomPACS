DROP VIEW ASU.VALLMEDKART
/

/* Formatted on 06.04.2016 15:19:01 (QP5 v5.115.810.9015) */
--
-- VALLMEDKART  (View)
--
--  Dependencies:
--   TAPOSTAVSHIK (Table)
--   PKGMEDKART (Package)
--   PKGTEDIZM (Package)
--   TAPRIH (Table)
--   TAPRIHCONT (Table)
--   TMEDIC (Table)
--   TMEDKART (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VALLMEDKART
(
   FK_MEDKARTID,
   FC_NAME,
   FK_MEDICID,
   FD_GODEN,
   FC_SERIAL,
   FC_COMMENT,
   FL_DEL,
   FK_POSTAVSHIKID,
   FC_MEDIC,
   FC_EDIZM
)
AS
     SELECT                                                    /*+FIRST_ROWS*/
           tmedkart.fk_id AS fk_medkartid,
              tmedkart.fc_name AS fc_name,
              tmedkart.fk_medicid AS fk_medicid,
              tmedkart.fd_goden,
              tmedkart.fc_serial,
              tmedkart.fc_comment AS fc_comment,
              tmedkart.fl_del,
              tapostavshik.fk_id AS fk_postavshikid,
              tmedic.fc_name AS fc_medic,
              PKGtedizm.GetNameByID (
                 pkgMedKart.GetUchEdIzm (tmedkart.fk_medicid)
              )
                 AS fc_edizm
       FROM   tmedkart, tmedic, tapostavshik
      WHERE   tmedic.fk_id = tmedkart.fk_medicid
              AND (EXISTS
                      (SELECT   p.fk_id
                         FROM   taprihcont pc, taprih p
                        WHERE   fk_medkartid = tmedkart.fk_id
                                AND pc.fk_aprihid = p.fk_id
                                AND (p.fk_apostavshikid = tapostavshik.fk_id
                                     OR p.fk_akomuid = tapostavshik.fk_id))
                   OR tmedkart.fk_apostavshikid = tapostavshik.fk_id)
   ORDER BY   tmedkart.fc_name
/


