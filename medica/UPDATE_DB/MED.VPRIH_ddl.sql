-- Start of DDL Script for View MED.VPRIH
-- Generated 28-май-2009 16:02:08 from MED@ASU

CREATE OR REPLACE VIEW med.vprih (
   postavid,
   motoid,
   mofromid,
   fc_comment,
   fp_vid,
   fp_vidmove,
   fn_price,
   moownerid,
   dpid,
   fc_docname,
   fc_docmix,
   data,
   fd_data,
   nameto,
   namefrom,
   fk_mogroupid_from,
   fk_mogroupid_to,
   mogr_from_fk_sklad_id,
   mogr_to_fk_sklad_id,
   fc_mogroupid_to,
   fc_mogroupid_from,
   idpostav,
   fl_edit,
   fd_invoice,
   fc_doc,
   fk_vid_post,
   fc_kontrakt,
   fc_schet_faktura,
   fk_finsource_id,
   fk_paycond_id )
AS
SELECT
    D.postavid,
    D.motoid,
    D.mofromid,
    D.fc_comment,
    D.fp_vid,
    D.fp_vidmove,
    D.fn_price,
    D.moownerid,
    D.dpid,
    med.GET_DECODEDOCVIDMOVE(fp_vidmove) as FC_DOCNAME,
    med.GET_DECODEDOCVIDMOVE(fp_vidmove)||' № '||D.fc_doc||' от '||to_char(D.fd_invoice,'dd.mm.yyyy') AS fc_docmix,
    trunc (D.fd_data) AS DATA,
    D.fd_data,
    mo_to.fc_name as NAMETO,
    mo_from.fc_name as NAMEFROM,
    mogr_from.groupid as fk_mogroupid_from,
    mogr_to.groupid as fk_mogroupid_to,
    mogr_from.FK_SKLAD_ID as mogr_from_FK_SKLAD_ID,
    mogr_to.FK_SKLAD_ID as mogr_to_FK_SKLAD_ID,
--'1' as fc_mogroupid_to,
    mogr_to.fc_group as fc_mogroupid_to,
--    DECODE (
--          FP_VID,
--          1, tpostav.fc_name, --MED.PKGTPOSTAV.GETNAMEBYID (D.postavid),
--          2, mogr_from.fc_group
--       ) AS fc_mogroupid_FROM,
       MED.PKGTDOCS.GET_DOC_SOURCE     (D.fp_vid, D.fp_vidmove, D.fk_mogroupid_FROM, D.postavid) as fc_mogroupid_from,
--       MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_vidmove, D.fk_mogroupid_TO, D.postavid) AS fc_mogroupid_to,
    tpostav.postavid AS idpostav,
    fl_edit,
    D.fd_Invoice,
    D.fc_doc,
    D.FK_VID_POST,
    D.FC_KONTRAKT, D.FC_SCHET_FAKTURA, D.FK_FINSOURCE_ID, D.FK_PAYCOND_ID
FROM (select tdocs.*, MED.PKG_PRIHRASH.Get_PrihRashPriznak(tdocs.FP_VID, tdocs.FP_VIDMOVE, tdocs.fk_mogroupid_from, tdocs.fk_mogroupid_to, MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) as mnoj
      from med.tdocs tdocs
      where (MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO in (tdocs.fk_mogroupid_from, tdocs.fk_mogroupid_to ))
        and  TRUNC(tdocs.FD_DATA) between TRUNC(med.pkg_medses.get_data1) and TRUNC(med.pkg_medses.get_data2)
      ) D,
 MED.tmo mo_from, MED.tmo mo_to, MED.tpostav, med.tmo_group mogr_from, med.tmo_group mogr_to
WHERE D.mnoj > 0
  AND motoid = mo_to.moid(+)
  AND mofromid = mo_from.moid(+)
  AND D.postavid = tpostav.postavid(+)
  AND D.fk_mogroupid_from = mogr_from.groupid(+)
  AND D.fk_mogroupid_to   = mogr_to.groupid(+)
/


-- End of DDL Script for View MED.VPRIH

