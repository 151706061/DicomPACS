DROP PROCEDURE ASU.DO_SAVEPEPL
/

--
-- DO_SAVEPEPL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPEOPLES (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_SAVEPEPL" -- Created by TimurLan
  -- LastUpdated : 26.10.2003 by TimurLan
(pFK_ID        IN NUMBER,
 pFC_FAM       IN VARCHAR2,
 pFC_IM        IN VARCHAR2,
 pFC_OTCH      IN VARCHAR2,
 pFD_ROJD      IN DATE,
 pFP_SEX       IN NUMBER,
 pFC_PHONE     IN VARCHAR2,
 pFC_FAX       IN VARCHAR2,
 pFC_EMAIL     IN VARCHAR2,
 pFC_HTTP      IN VARCHAR2,
 pFC_ROJDPLACE IN VARCHAR2,
 pFK_GROUPID   IN NUMBER,
 pFK_DOCVID    IN NUMBER,
 pFC_DOCSER    IN VARCHAR2,
 pFC_DOCNUM    IN VARCHAR2,
 pFC_DOCVIDAN  IN VARCHAR2,
 pFD_DOCDATE   IN DATE,
 pFK_COMPANY   IN NUMBER,
 pFK_OTDEL     IN NUMBER,
 pFK_DOLGNOST  IN NUMBER,
 pFC_RABOTA    IN VARCHAR2) IS
  CURSOR cExists IS
    SELECT /*+ first_row*/
     COUNT(FK_ID)
      FROM TKARTA
     WHERE FK_PEPLID = pFK_ID;
  nTemp NUMBER;
BEGIN
  UPDATE TPeoples
     SET FC_FAM       = pFC_FAM,
         FC_IM        = pFC_IM,
         FC_OTCH      = pFC_OTCH,
         FP_SEX       = pFP_SEX,
         FD_ROJD      = pFD_ROJD,
         FC_PHONE     = pFC_PHONE,
         FC_FAX       = pFC_FAX,
         FC_E_MAIL    = pFC_EMAIL,
         FC_HTTP      = pFC_HTTP,
         FC_ROJDPLACE = pFC_ROJDPLACE,
         FK_GROUPID   = pFK_GROUPID,
         FK_DOCVID    = pFK_DOCVID,
         FC_DOCSER    = pFC_DOCSER,
         FC_DOCNUM    = pFC_DOCNUM,
         FC_DOCVIDAN  = pFC_DOCVIDAN,
         FD_DOCDATE   = pFD_DOCDATE,
         FK_COMPANYID = pFK_COMPANY,
         FK_OTDEL     = pFK_OTDEL,
         FK_DOLGNOST  = pFK_DOLGNOST,
         FC_RABOTA    = pFC_RABOTA
  --         Fk_Docvid = (select fk_id from TVIDDOC where fl_default=1)
   WHERE TPeoples.FK_ID = pFK_ID;
  open cExists;
  fetch cExists
    into nTemp;
  close cExists;
  if nTemp > 0 then
    UPDATE TKARTA
       SET FC_FAM       = pFC_FAM,
           FC_IM        = pFC_IM,
           FC_OTCH      = pFC_OTCH,
           FP_SEX       = pFP_SEX,
           FD_ROJD      = pFD_ROJD,
           FC_PHONE     = pFC_PHONE,
           FC_FAX       = pFC_FAX,
           FC_E_MAIL    = pFC_EMAIL,
           FC_HTTP      = pFC_HTTP,
           FC_ROJDPLACE = pFC_ROJDPLACE,
           FK_GROUPID   = pFK_GROUPID,
           FK_DOCVID    = pFK_DOCVID,
           FC_DOCSER    = pFC_DOCSER,
           FC_DOCNUM    = pFC_DOCNUM,
           FC_DOCVIDAN  = pFC_DOCVIDAN,
           FD_DOCDATE   = pFD_DOCDATE,
           FC_RABOTA    = pFC_RABOTA
     WHERE TKARTA.FK_PEPLID = pFK_ID;
  END if;
end DO_SavePEPL;
/

SHOW ERRORS;


