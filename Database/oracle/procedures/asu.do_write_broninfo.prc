DROP PROCEDURE ASU.DO_WRITE_BRONINFO
/

--
-- DO_WRITE_BRONINFO  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TBRONINFO (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_BRONINFO" -- Modified by Marriage
 (
  pFK_ID in out NUMBER,
  pFK_OTDELID in NUMBER,
  pFK_KOMFORTID in NUMBER,
  pFK_TYPEDOCID in NUMBER,
  pFK_TARIFID in NUMBER,
  pFK_SROKID in NUMBER,
  pFC_DIAG in VARCHAR2,
  pFK_VRACHID in number,
  pFK_PROFID in number,
  pFC_FAM in VARCHAR2,
  pFC_IM in VARCHAR2,
  pFC_OTCH in VARCHAR2,
  pFD_ROJD in Date,
  pFP_SEX in number,
  
  pFC_ADR in VARCHAR2,
  pFC_WORK in VARCHAR2,
  pFC_DOL in VARCHAR2,
  pFC_STRAHPOL in VARCHAR2,
  pFC_KODLGOT in VARCHAR2,
  pFC_KODMKB in VARCHAR2,
  pFC_OBOSNOV in VARCHAR2
 )
   IS
   CURSOR cTemp IS SELECT /*+first_row*/COUNT(FK_ID) FROM TBRONINFO WHERE FK_ID=pFK_ID;
   nTemp NUMBER;

BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if nTemp=0 then
    INSERT INTO TBRONINFO(
                         FK_OTDELID,
                         FK_KOMFORTID,
                         FK_TYPEDOCID,
                         FK_TARIFID,
                         FK_SROKID,
                         FC_DIAG,
                         FK_VRACHID,
                         FK_PROFID,
                         FC_FAM,
                         FC_IM,
                         FC_OTCH,
                         FD_ROJD,
                         FP_SEX,
                         
                         FC_ADRES,
                         FC_WORKPLACE,
                         FC_DOLGNOST,
                         FC_STRAHPOLNUM,
                         FC_KODLGOT,
                         FC_KODMKB,
                         FC_OBOSNOVANIE
                        )
                  VALUES(
                         pFK_OTDELID,
                         pFK_KOMFORTID,
                         pFK_TYPEDOCID,
                         pFK_TARIFID,
                         pFK_SROKID,
                         pFC_DIAG,
                         pFK_VRACHID,
                         pFK_PROFID,
                         pFC_FAM,
                         pFC_IM,
                         pFC_OTCH,
                         pFD_ROJD,
                         pFP_SEX,
                         
                         pFC_ADR,
                         pFC_WORK,
                         pFC_DOL,
                         pFC_STRAHPOL,
                         pFC_KODLGOT,
                         pFC_KODMKB,
                         pFC_OBOSNOV                         
                        )
     returning FK_ID INTO pFK_ID;
  else
    UPDATE TBRONINFO SET
     FK_OTDELID = pFK_OTDELID,
     FK_KOMFORTID = pFK_KOMFORTID,
     FK_TYPEDOCID = pFK_TYPEDOCID,
     FK_TARIFID = pFK_TARIFID,
     FK_SROKID = pFK_SROKID,
     FC_DIAG = pFC_DIAG,
     FK_VRACHID = pFK_VRACHID,
     FK_PROFID = pFK_PROFID,

     FC_FAM = pFC_FAM,
     FC_IM = pFC_IM,
     FC_OTCH = pFC_OTCH,
     FD_ROJD = pFD_ROJD,
     FP_SEX = pFP_SEX,
     
     FC_ADRES = pFC_ADR,
     FC_WORKPLACE = pFC_WORK,
     FC_DOLGNOST = pFC_DOL,
     FC_STRAHPOLNUM = pFC_STRAHPOL,
     FC_KODLGOT = pFC_KODLGOT,
     FC_KODMKB = pFC_KODMKB,
     FC_OBOSNOVANIE = pFC_OBOSNOV     

    WHERE FK_ID=pFK_ID RETURNING FK_SROKID INTO nTemp;
  end if;
END;
/

SHOW ERRORS;


