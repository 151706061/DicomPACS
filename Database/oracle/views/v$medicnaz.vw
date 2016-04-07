DROP VIEW ASU.V$MEDICNAZ
/

/* Formatted on 06.04.2016 15:19:12 (QP5 v5.115.810.9015) */
--
-- V$MEDICNAZ  (View)
--
--  Dependencies:
--   PKG_COMMON (Package)
--   PKGMEDKART (Package)
--   PKGTEDIZM (Package)
--   PKGTFARMGR (Package)
--   PKGTUCHGR (Package)
--   TMEDIC (Table)
--   TKART (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.V$MEDICNAZ
(
   MEDICID,
   FC_NAME,
   LEVELID,
   EIID,
   FC_EIID,
   FARMGRID,
   FD_GODEN,
   FARMGR,
   SERIA,
   UCHGRID,
   UCHGR
)
AS
   SELECT   med.tmedic.medicid,
            med.tmedic.fc_name,
            levelid,
            eiid,
            med.pkgtedizm.GetNameByIDokei (eiid) AS fc_eiid,
            farmgrid,
            TRUNC (fd_goden) AS fd_goden,
            med.PKGTFARMGR.GetNameByID (farmgrid) AS farmgr,
            med.pkgmedkart.getserialbyid (kartid) AS seria,
            tmedic.uchgrid,
            med.PKGTUCHGR.GetNameByID (tmedic.uchgrid) AS uchgr -- For vitiaz, med.pkgmedkart.GetOstMedic (medicid, SYSDATE, med.get_moaptid) as fn_ost
     FROM   med.tmedic, med.tkart
    WHERE       (levelid >= pkg_common.get_oslevel OR levelid = 68)
            AND med.tmedic.medicid = med.tkart.medicid
            AND fl_del = 0
/


