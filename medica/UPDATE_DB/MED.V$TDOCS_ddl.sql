-- Start of DDL Script for View MED.V$TDOCS
-- Generated 26.11.2008 14:27:08 from MED@ASU

CREATE OR REPLACE VIEW med.v$tdocs (
   dpid,
   moownerid,
   fd_data,
   fc_doc,
   fp_vid,
   fc_comment,
   mofromid,
   motoid,
   postavid,
   fn_price,
   fp_vidmove,
   fl_edit,
   fd_invoice,
   fl_treb,
   fn_spisanievid,
   fk_mogroupid,
   fk_mogroupid_to,
   fk_mogroupid_from,
   fk_sklad_id )
AS
SELECT d."DPID", d."MOOWNERID", d."FD_DATA", d."FC_DOC", d."FP_VID",
       d."FC_COMMENT", d."MOFROMID", d."MOTOID", d."POSTAVID", d."FN_PRICE",
       d."FP_VIDMOVE", d."FL_EDIT", d."FD_INVOICE", d."FL_TREB",
       d."FN_SPISANIEVID", d."FK_MOGROUPID", d."FK_MOGROUPID_TO",
       d."FK_MOGROUPID_FROM", d."FK_SKLAD_ID"
  FROM med.tdocs d
 WHERE (med.pkg_medses.get_isusesklad = 0)
    OR (d.fk_sklad_id = med.pkg_medses.get_cur_mo_sklad_id)
/


-- End of DDL Script for View MED.V$TDOCS

