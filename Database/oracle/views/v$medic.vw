DROP VIEW ASU.V$MEDIC
/

/* Formatted on 06.04.2016 15:19:11 (QP5 v5.115.810.9015) */
--
-- V$MEDIC  (View)
--
--  Dependencies:
--   PKGTEDIZM (Package)
--   PKGTFARMGR (Package)
--   PKGTUCHGR (Package)
--   TMEDIC (Table)
--   TKART (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V$MEDIC
(
   FN_PRICE,
   MEDICID,
   FC_NAME,
   LEVELID,
   EIID,
   FC_EIID,
   FARMGRID,
   FD_GODEN,
   FARMGR,
   UCHGRID,
   UCHGR,
   FK_NOMEN_RLS
)
AS
     SELECT                                              --         k2.kartid,
           NVL (k2.fn_price, 0) AS fn_price,
              m2.medicid,
              m2.fc_name,
              m2.levelid,
              m2.eiid,
              med.pkgtedizm.getnamebyidokei (m2.eiid) AS fc_eiid,
              m2.farmgrid,
              /*trunc(k.fd_goden)*/
              k2.fd_goden AS fd_goden,
              med.pkgtfarmgr.getnamebyid (m2.farmgrid) AS farmgr,
              m2.uchgrid,
              med.pkgtuchgr.getnamebyid (m2.uchgrid) AS uchgr,
              -- For vitiaz, med.pkgmedkart.GetOstMedic (medicid, SYSDATE, med.get_moaptid) as fn_ost
              m2.fk_nomen_rls
       FROM   (SELECT   m.medicid,
                        m.fc_name,
                        m.eiid,
                        m.levelid,
                        m.uchgrid,
                        m.farmgrid,
                        m.fk_nomen_rls,
                        k1.max_kartid
                 FROM   med.tmedic m,
                        (  SELECT   k.medicid, MAX (k.kartid) AS max_kartid
                             FROM   med.tkart k
                            WHERE   k.fl_del = 0
                         GROUP BY   k.medicid) k1
                WHERE   m.medicid = k1.medicid
                        AND m.fl_visible_for_not_apteka = 1 -- ORDER BY m.fc_name
                                                           ) m2,
              med.tkart k2
      WHERE   m2.max_kartid = k2.kartid
   ORDER BY   m2.fc_name
/


