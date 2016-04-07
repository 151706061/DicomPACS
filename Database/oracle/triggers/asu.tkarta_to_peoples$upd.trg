DROP TRIGGER ASU.TKARTA_TO_PEOPLES$UPD
/

--
-- TKARTA_TO_PEOPLES$UPD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPEOPLES (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_TO_PEOPLES$UPD" 
 AFTER
   UPDATE OF fc_docnum, fc_docser, fc_docvidan, fc_e_mail, fc_fam, fc_fax, fc_http, fc_im, fc_otch, fc_phone, fc_rabota, fd_docdate, fd_rojd, fk_docvid, fk_groupid, fp_sex
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
BEGIN
  UPDATE TPEOPLES
  SET FC_FAM = :new.fc_fam,
      FC_IM = :new.fc_im,
      FC_OTCH = :new.fc_otch,
      FP_SEX = :new.fp_sex,
      FD_ROJD = :new.fd_rojd,
      FK_DOCVID = :new.fk_docvid,
      FC_DOCSER = :new.fc_docser,
      FC_DOCNUM = :new.fc_docnum,
      FD_DOCDATE = :new.fd_docdate,
      FC_DOCVIDAN = :new.fc_docvidan,
      FC_RABOTA = :new.fc_rabota,
      FC_PHONE = :new.fc_phone,
      FC_FAX = :new.fc_fax,
      FC_E_MAIL = :new.fc_e_mail,
      FC_HTTP = :new.fc_http,
      FK_GROUPID = :new.fk_groupid
  WHERE TPEOPLES.FK_ID = :old.fk_peplid;
--  UPDATE TADRESS
--  SET fk_countryid = :new.fk_countryid,
--      fk_regionid = :new.fk_regionid,
--      fk_townid = :new.fk_townid,
--      fc_adr = :new.fc_adr
--  WHERE (TADRESS.FK_PACID = :old.fk_peplid)
--    AND (TADRESS.FK_TYPE = (select TADRTYPE.FK_ID from TADRTYPE where TADRTYPE.FL_DEFAULT = 1));
END;
/
SHOW ERRORS;


