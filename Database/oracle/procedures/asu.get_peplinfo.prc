DROP PROCEDURE ASU.GET_PEPLINFO
/

--
-- GET_PEPLINFO  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVIDDOC (Table)
--   TCOUNTRY (Table)
--   TADRESS (Table)
--   TADRTYPE (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TPEOPLES (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   TSTREET (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_PEPLINFO" -- Created by TimurLan
  -- LastUpdated : 26.10.2003 by TimurLan
(pFK_ID        IN OUT NUMBER,
 pFC_FAM       OUT VARCHAR2,
 pFC_IM        OUT VARCHAR2,
 pFC_OTCH      OUT VARCHAR2,
 pFD_ROJD      OUT DATE,
 pFP_SEX       OUT NUMBER,
 pFC_PHONE     OUT VARCHAR2,
 pFC_FAX       OUT VARCHAR2,
 pFC_EMAIL     OUT VARCHAR2,
 pFC_HTTP      OUT VARCHAR2,
 pFC_ROJDPLACE OUT VARCHAR2,
 pFK_GROUPID   OUT NUMBER,
 pFK_DOCVID    OUT NUMBER,
 pFC_DOCSER    OUT VARCHAR2,
 pFC_DOCNUM    OUT VARCHAR2,
 pFC_DOCVIDAN  OUT VARCHAR2,
 pFD_DOCDATE   OUT DATE,
 pFK_COMPANY   OUT NUMBER,
 pFK_OTDEL     OUT NUMBER,
 pFK_DOLGNOST  OUT NUMBER,
 pFC_RABOTA    OUT VARCHAR2) AS
  CURSOR cExists IS
    SELECT /*+ first_row*/
     COUNT(FK_ID)
      FROM TPEOPLES
     WHERE FK_ID = pFK_ID;
  CURSOR cMain IS
    SELECT FC_FAM,
           FC_IM,
           FC_OTCH,
           FD_ROJD,
           FP_SEX,
           FC_PHONE,
           FC_FAX,
           FC_E_MAIL,
           FC_HTTP,
           FC_ROJDPLACE,
           FK_GROUPID,
           FK_DOCVID,
           FC_DOCSER,
           FC_DOCNUM,
           FC_DOCVIDAN,
           FD_DOCDATE,
           FK_COMPANYID,
           FK_OTDEL,
           FK_DOLGNOST,
           FC_RABOTA
      FROM TPeoples
     WHERE FK_ID = pFK_ID;
  CURSOR cAdrCount IS
    SELECT COUNT(ROWID) FROM TADRESS WHERE FK_PACID = pFK_ID;
  nTemp  NUMBER;
  nAdrID NUMBER;
BEGIN
  open cExists;
  fetch cExists into nTemp;
  close cExists;
  if nTemp = 0 then
    Insert into TPeoples
      (Fc_Fam)
    values
      (NULL)
    Returning FK_ID into pFK_ID;
    --    select FK_ID into pFK_ID from TPeoples where FC_Fam is NULL;
    --    insert into TAdress (FK_PACID) VALUES(pFK_ID);
  end if;
  if PKG_SMINI.READSTRING('CONFIG', 'B_USE_DEFAULT', 0) = 1 then
    SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
    if nTemp = 1 then
      SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
      Update TPeoples set Fk_Docvid = nTemp WHERE FK_ID = pFK_ID;
    end if;
    open cAdrCount;
    fetch cAdrCount
      into nTemp;
    close cAdrCount;
    if (nTemp = 0) or (nTemp is null) then
      SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT = 1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT = 1;
        INSERT INTO TADRESS
          (FK_TYPE, FK_PACID)
        VALUES
          (nTemp, pFK_ID)
        RETURNING FK_ID INTO nAdrID;
        SELECT COUNT(FK_ID) INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_COUNTRYID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TREGION WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TREGION WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_REGIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TTOWN WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TTOWN WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_TOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TRAION WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TRAION WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_RAIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TINTOWN WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TINTOWN WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_INTOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TSTREET WHERE FL_DEFAULT = 1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TSTREET WHERE FL_DEFAULT = 1;
          Update TADRESS set FK_STREETID = nTemp WHERE FK_ID = nAdrID;
        end if;
      end if;
    end if;
  end if;

  OPEN cMain;
  FETCH cMain
    INTO pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD, pFP_SEX, pFC_PHONE, pFC_FAX, pFC_EMAIL, pFC_HTTP, pFC_ROJDPLACE, pFK_GROUPID, pFK_DOCVID, pFC_DOCSER, pFC_DOCNUM, pFC_DOCVIDAN, pFD_DOCDATE, pFK_COMPANY, pFK_OTDEL, pFK_DOLGNOST, pFC_RABOTA;
  CLOSE cMain;
end GET_PEPLINFO;
/

SHOW ERRORS;


