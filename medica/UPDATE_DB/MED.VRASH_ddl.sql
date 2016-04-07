-- Start of DDL Script for View MED.VRASH
-- Generated 12-май-2007 17:43:03 from MED@ASU
CREATE OR REPLACE VIEW med.vrash (
   namefrom,
   fl_edit,
   numdoc,
   viddoc,
   fp_vidmove,
   mofromid,
   fc_comment,
   fp_vid,
   fn_price,
   moownerid,
   dpid,
   fc_doc,
   data,
   motoid,
   fd_data,
   fk_curmogroupid )
AS
SELECT  tmo.fc_name as namefrom,fl_edit,to_number(fc_doc) as numdoc,decodedoc(fp_vidmove) as viddoc,fp_vidmove, mofromid, tdocs.fc_comment, fp_vid, fn_price,
       moownerid, tdocs.dpid, fc_doc, trunc (tdocs.fd_data) AS DATA, motoid,fd_data,
    (SELECT TMO.fk_curmogroupid  FROM MED.TMO where TMO.moid = pkg_medses.get_curmo) fk_curmogroupid
FROM   tdocs,tmo
WHERE
  fp_vid = 3 and
  mofromid=tmo.moid
and fd_data between trunc(pkg_medses.get_data1) and trunc(pkg_medses.get_data2+1)-1/(24*60*60) 
AND tdocs.fk_mogroupid = fk_curmogroupid
--AND    (moownerid = pkg_medses.get_curmo or mofromid = pkg_medses.get_curmo)
/*
SELECT  tmo.fc_name as namefrom,fl_edit,to_number(fc_doc) as numdoc,decodedoc(fp_vidmove) as viddoc,fp_vidmove, mofromid, tdocs.fc_comment, fp_vid, fn_price,
       moownerid, tdocs.dpid, fc_doc, trunc (tdocs.fd_data) AS DATA, motoid,fd_data
FROM   tdocs,tmo
WHERE   fp_vid = 3  and mofromid=tmo.moid 
and fd_data between trunc(pkg_medses.get_data1) and trunc(pkg_medses.get_data2+1)-1/(24*60*60) 
AND    (moownerid = pkg_medses.get_curmo or mofromid = pkg_medses.get_curmo)
*/
/
-- End of DDL Script for View MED.VRASH