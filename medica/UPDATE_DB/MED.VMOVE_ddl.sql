-- Start of DDL Script for View MED.VMOVE
-- Generated 10-мар-2009 11:29:23 from MED@ASU

CREATE OR REPLACE VIEW med.vmove (
   row_id,
   motoid,
   mofromid,
   fk_mogroupid_from,
   fk_mogroupid_to,
   fc_mogroupid_from_orig,
   fc_mogroupid_to_orig,
   mogr_from_fk_sklad_id,
   mogr_to_fk_sklad_id,
   fc_mogroupid_from,
   fc_mogroupid_to,
   fl_edit,
   vidmove,
   fp_vid,
   fp_vidmove,
   fc_comment,
   fn_price,
   dpid,
   fc_docname,
   fc_doc,
   data,
   namefrom,
   moownerid,
   nameto,
   fd_data,
   fd_invoice,
   fc_docmix,
   fn_spisanievid,
   mnoj,
   fc_postav_name,
   fc_rekviziti )
AS
SELECT
       D.ROWID as ROW_ID,
       D.motoid, D.mofromid,
       D.fk_mogroupid_from, D.fk_mogroupid_to,
--
       mogr_from.fc_group as fc_mogroupid_from_orig,
       mogr_to.fc_group as fc_mogroupid_to_orig,
       mogr_from.FK_SKLAD_ID as mogr_from_FK_SKLAD_ID,
       mogr_to.FK_SKLAD_ID as mogr_to_FK_SKLAD_ID,
       MED.PKGTDOCS.GET_DOC_SOURCE (D.fp_vid, D.fp_vidmove, D.fk_mogroupid_FROM, D.postavid) as fc_mogroupid_from,
       MED.PKGTDOCS.GET_DOC_DESTINATION(D.fp_vid, D.fp_vidmove, D.fk_mogroupid_TO, D.postavid) AS fc_mogroupid_to,
--
       D.fl_edit,
       med.get_decodedocvid(fp_vidmove) as vidmove,
       D.fp_vid,
       D.fp_vidmove, D.fc_comment, D.fn_price, D.dpid,
       med.GET_DECODEDOCVIDMOVE(fp_vidmove) as FC_DOCNAME, D.fc_doc,
       trunc (D.fd_data) AS DATA, tmo_from.fc_name AS namefrom,moownerid,
       tmo_to.fc_name AS nameto,fd_data, D.fd_invoice,
       med.GET_DECODEDOCVIDMOVE(fp_vidmove)||' № '||D.fc_doc||' от '||to_char(D.fd_invoice,'dd.mm.yyyy') AS fc_docmix,
       fn_spisanievid,
       d.mnoj,
       p.fc_name as FC_POSTAV_NAME, p.FC_REKVIZITI
--
FROM  (select tdocs.*, MED.PKG_PRIHRASH.Get_PrihRashPriznak(tdocs.FP_VID, tdocs.FP_VIDMOVE, tdocs.fk_mogroupid_from, tdocs.fk_mogroupid_to, MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO) as mnoj
       from med.TDOCS tdocs
       where (MED.PKG_MEDSES.GET_CUR_MOGROUP_BY_CUR_MO in (tdocs.fk_mogroupid_from, tdocs.fk_mogroupid_to ))
         and  TRUNC(FD_DATA) between TRUNC(med.pkg_medses.get_data1) and TRUNC(med.pkg_medses.get_data2)
          ) D,
      med.tmo tmo_from, med.tmo tmo_to, med.tmo_group mogr_from, med.tmo_group mogr_to, med.tpostav p
WHERE D.mnoj < 0 -- проверка записи на признак расхода
  AND D.motoid = tmo_to.moid(+)
  AND D.mofromid = tmo_from.moid(+)
  AND D.fk_mogroupid_from = mogr_from.groupid(+)
  AND D.fk_mogroupid_to   = mogr_to.groupid(+)
  and D.POSTAVID = p.POSTAVID(+)
/


-- End of DDL Script for View MED.VMOVE

