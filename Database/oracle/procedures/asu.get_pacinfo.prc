DROP PROCEDURE ASU.GET_PACINFO
/

--
-- GET_PACINFO  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SET_NEWIBNUM (Function)
--   TGROUP (Table)
--   TVID (Table)
--   TVIDDOC (Table)
--   TCOC_POL (Table)
--   TCOUNTRY (Table)
--   TPACVID (Table)
--   TADRESS (Table)
--   TADRTYPE (Table)
--   TDOCOBSL (Table)
--   TRAION (Table)
--   TTIPROOM (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TPEOPLES (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   DO_ADD_FAKTS (Procedure)
--   DO_ADD_PLANS (Procedure)
--   GET_FCPALATA (Function)
--   GET_IB (Function)
--   GET_PACHRAP (Function)
--   GET_PACKUR (Function)
--   GET_PACPALATAID (Function)
--   GET_PACSUBVID (Function)
--   GET_PACVRACH (Function)
--   GET_PAC_GROUPID (Function)
--   DO_VRACHFIO (Function)
--   DO_WRITE_PERESEL (Procedure)
--   TUSLVID (Table)
--   TSTREET (Table)
--   TKARTA (Table)
--   TPRIZN (Table)
--   TEPID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_PACINFO" 
-- Modified by TimurLana
-- Modified by Nefedov 12.04.2006
  ( pFK_ID IN OUT NUMBER,
   pFK_IB OUT VARCHAR2,
   pFK_VRACHID OUT NUMBER,
   pFC_VRACH OUT VARCHAR2,
   pFK_PALATAID OUT NUMBER,
   pFC_PALATA OUT VARCHAR2,
   pFL_VOV OUT NUMBER,
   pFL_IVOV OUT NUMBER,
   pFL_ULA OUT NUMBER,
   pFL_PMC OUT NUMBER,
   pFK_KOD OUT NUMBER,
   pFK_KOD2 OUT NUMBER,
   pFC_PUT OUT VARCHAR2,
   pFN_SUM OUT NUMBER,
   pFK_COC_POLID OUT NUMBER,
   pFK_GROUPID OUT NUMBER,
   pFK_PUTTYPE OUT NUMBER,
   pFC_PISMO OUT VARCHAR2,
   pFK_PRIZNID OUT NUMBER,
   pFD_PRIB OUT DATE,
   pFP_TRAN OUT NUMBER,
   pFK_REIS OUT VARCHAR2,
   pFC_FROM OUT VARCHAR2,
   pFL_ALERG OUT NUMBER,
   pFL_MET_ROP OUT NUMBER,
   pFL_KUR OUT NUMBER,
   pFL_HRAP OUT NUMBER,
   pFK_MASTER IN NUMBER,
   pFL_SPUTNIK IN NUMBER,
   pFK_FINVIDID OUT NUMBER,
   pFK_SANID OUT NUMBER,
   pFK_USLVIDID IN OUT NUMBER,  -- Eddited by Kosov 12.07.2010
   pFL_SKK OUT NUMBER,
   pFL_SEO OUT NUMBER,
   pFL_ILL OUT NUMBER,
--   ПОШЛИ ПЕРЕМЕННЫЕ ПИПЛА
   pFK_PEPLID IN OUT NUMBER,
   pFC_FAM OUT VARCHAR2,
   pFC_IM OUT VARCHAR2,
   pFC_OTCH OUT VARCHAR2,
   pFD_ROJD OUT DATE,
   pFP_SEX OUT NUMBER,
   pFC_PHONE OUT VARCHAR2,
   pFC_FAX OUT VARCHAR2,
   pFC_EMAIL OUT VARCHAR2,
   pFC_HTTP OUT VARCHAR2,
   pFK_DOCVID OUT NUMBER,
   pFC_DOCSER OUT VARCHAR2,
   pFC_DOCNUM OUT VARCHAR2,
   pFC_DOCVIDAN OUT VARCHAR2,
   pFD_DOCDATE OUT DATE,
--   pFK_TOWNID OUT  NUMBER,pFK_COUNTRYID OUT  NUMBER,pFK_REGIONID OUT  NUMBER,pFC_ADR OUT  VARCHAR2,
   pFC_RABOTA OUT VARCHAR2,
   pFK_COMPANY OUT NUMBER,
   pFK_OTDEL OUT NUMBER,
   pFK_DOLGNOST OUT NUMBER,
   pFC_ROJDPLACE OUT VARCHAR2,
   pFL_PRIVIT OUT NUMBER,
   pFK_PACVID OUT NUMBER,
   pFL_PAYPLACE OUT NUMBER,
   pFK_STOLID OUT NUMBER
   )
AS
CURSOR cVrach IS SELECT FK_VRACH,DO_VRACHFIO(FK_VRACH) From (SELECT GET_PACVRACH(pFK_ID) FK_VRACH FROM DUAL);
CURSOR cExists IS SELECT /*+ first_row*/COUNT(FK_ID)   From TKARTA WHERE FK_ID=pFK_ID;
--CURSOR cIBID IS SELECT FK_IBID From TKARTA WHERE FK_ID=pFK_ID;
--CURSOR cIB IS SELECT GET_IB(TKARTA.FK_ID) AS FK_IB FROM TKARTA WHERE TKARTA.FK_ID=pFK_ID;
CURSOR cCurrPalata IS SELECT FK_PALATAID,GET_FCPALATA(FK_PALATAID) From (SELECT GET_PACPALATAID(pFK_ID) FK_PALATAID FROM DUAL);
CURSOR cEpid IS SELECT /*+ rule*/FD_PRIB,FP_TRAN,FK_REIS,FC_FROM,FL_ALERG,FL_MET_ROP From TEPID WHERE FK_PACID=pFK_ID;
CURSOR cMain IS SELECT /*+ rule*/
             FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_KOD,FK_KOD2,FC_PUT,FN_SUM,FK_COC_POLID,
             GET_PAC_GROUPID(TKARTA.FK_GROUPID,TPeoples.FK_GROUPID),FK_PUTTYPE,GET_PACSUBVID(FK_KOD2,FK_KOD),FK_PRIZN,FK_FINVIDID,
             FK_SANID,FK_USLVIDID,FL_SKK,FL_SEO,FL_ILL,
             TPeoples.FC_FAM,TPeoples.FC_IM,TPeoples.FC_OTCH,TPeoples.FD_ROJD,TPeoples.FP_SEX,
             TPeoples.FC_PHONE,TPeoples.FC_FAX,TPeoples.FC_E_MAIL,TPeoples.FC_HTTP,NVL(TPeoples.FK_DOCVID, -1),
             TPeoples.FC_DOCSER,TPeoples.FC_DOCNUM,TPeoples.FC_DOCVIDAN,TPeoples.FD_DOCDATE,
             TPeoples.FC_RABOTA,NVL(TPeoples.Fk_Companyid,-1),NVL(TPeoples.Fk_Otdel,-1),NVL(TPeoples.Fk_Dolgnost,-1),TPeoples.Fc_Rojdplace,
             FL_PRIVIT,FK_PACVID,FL_PAYPLACE,FK_STOLID
        FROM TKARTA, TPEOPLES
       WHERE TKARTA.FK_ID=pFK_ID AND TPEOPLES.FK_ID=pFK_PEPLID;
nTemp NUMBER;
nAdrID NUMBER;
nDocObslID NUMBER;
BEGIN
--Is this patient exists?
  OPEN cExists;
  FETCH cExists INTO nTemp;
  CLOSE cExists;
  if nTemp>1 then
    raise_application_error(-2004,'Ошибка! Найдено более одного пациента с одинаковым идентификационным номером!');
  end if;
  if nTemp=0 then
    if pFK_USLVIDID = 0 or pFK_USLVIDID = -1 or pFK_USLVIDID is null then  -- Added by Kosov
      SELECT FK_ID into pFK_USLVIDID from TUSLVID where FL_DEFAULT = 1 and RowNum =1;
    end if;
--    INSERT INTO TKARTA (FK_ID,FK_MASTER,FL_SPUTNIK,FK_DOCVID) values (pFK_ID,pFK_MASTER,pFL_SPUTNIK,nTemp)RETURNING FK_ID INTO pFK_ID;
    INSERT INTO TKARTA (FK_ID,FK_MASTER,FL_SPUTNIK, FK_USLVIDID)
                values (pFK_ID,pFK_MASTER,pFL_SPUTNIK, pFK_USLVIDID)
                RETURNING FK_ID INTO pFK_ID;
    Insert into TPeoples (Fc_Fam)
                values (NULL)
                RETURNING FK_ID INTO pFK_PEPLID;
    -- Установим номер док-та обслуживания
    nDocObslID:=asu.SET_NewIBNum(pFK_USLVIDID,nTemp);
    pFK_IB:=nTemp||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');
    -- Вставим уникальный номер документа обслуживания для нового пациента
    insert into TDocObsl (fk_viddocid,fk_numib,fn_year) values (pFK_USLVIDID,nTemp,TO_CHAR(TRUNC(SYSDATE),'YYYY'))
        RETURNING FK_ID INTO nDocObslID;
    Update TKarta SET
           FK_IBID = nTemp,
           FK_IBY = TO_CHAR(TRUNC(SYSDATE),'YYYY'),
           FK_PEPLID = pFK_PEPLID WHERE FK_ID = pFK_ID;
    if PKG_SMINI.READSTRING ('CONFIG', 'B_USE_DEFAULT', 0) = 1 then
      SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
        Update TPeoples set Fk_Docvid = nTemp WHERE FK_ID = pFK_PEPLID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TTIPROOM WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TTIPROOM WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PUTTYPE = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TVID WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TVID WHERE FL_DEFAULT=1;
        Update TKARTA set FK_KOD2 = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TCOC_POL WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TCOC_POL WHERE FL_DEFAULT=1;
        Update TKARTA set FK_COC_POLID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TPACVID WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TPACVID WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PACVID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
        Update TKARTA set FK_GROUPID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
        Update TKARTA set FK_PRIZN = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
        INSERT INTO TADRESS (FK_TYPE,FK_PACID)
                    VALUES (nTemp,pFK_PEPLID)
                    RETURNING FK_ID INTO nAdrID;
        SELECT COUNT(FK_ID) INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT=1;
          Update TADRESS set FK_COUNTRYID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TREGION WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TREGION WHERE FL_DEFAULT=1;
          Update TADRESS set FK_REGIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TTOWN WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TTOWN WHERE FL_DEFAULT=1;
          Update TADRESS set FK_TOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TRAION WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TRAION WHERE FL_DEFAULT=1;
          Update TADRESS set FK_RAIONID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TINTOWN WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TINTOWN WHERE FL_DEFAULT=1;
          Update TADRESS set FK_INTOWNID = nTemp WHERE FK_ID = nAdrID;
        end if;
        SELECT COUNT(FK_ID) INTO nTemp FROM TSTREET WHERE FL_DEFAULT=1;
        if nTemp = 1 then
          SELECT FK_ID INTO nTemp FROM TSTREET WHERE FL_DEFAULT=1;
          Update TADRESS set FK_STREETID = nTemp WHERE FK_ID = nAdrID;
        end if;
      end if;
    end if;
    DO_ADD_PLANS(pFK_ID,TRUNC(SYSDATE,'MI'),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),/*SYSDATE,SYSDATE,SYSDATE,*/0,0,0);
    DO_ADD_FAKTS(pFK_ID,TRUNC(SYSDATE,'MI'),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),/*SYSDATE,SYSDATE,SYSDATE,*/0,0,0,0);
    DO_WRITE_PERESEL(-1,pFK_ID,TRUNC(SYSDATE,'MI'),TRUNC(TRUNC(SYSDATE,'MI')+1)-1/(24*60),/*SYSDATE,SYSDATE,*/-1,0);
    -- Установим ссылку из пересела на новый документ обслуживания
    --update TPeresel set fk_docobslid = nDocObslID where fk_id = GET_MAXPERESELID(pFK_ID);
  end if;
--Get vrach
  OPEN cVrach;
  FETCH cVrach INTO pFK_VRACHID,pFC_VRACH;
  CLOSE cVrach;
--Get Palata
  OPEN cCurrPalata;
  FETCH cCurrPalata INTO pFK_PALATAID,pFC_PALATA;
  CLOSE cCurrPalata;
  if pFK_PALATAID IS NULL then
    pFK_PALATAID:=-1;
  end if;
--Get MAIN info
  OPEN cMain;
  FETCH cMain INTO pFL_VOV,pFL_IVOV,pFL_ULA,pFL_PMC,pFK_KOD,pFK_KOD2,pFC_PUT,pFN_SUM,
                   pFK_COC_POLID,pFK_GROUPID,pFK_PUTTYPE,pFC_PISMO,pFK_PRIZNID,pFK_FINVIDID,pFK_SANID,
                   pFK_USLVIDID,pFL_SKK,pFL_SEO,pFL_ILL,
                   pFC_FAM,pFC_IM,pFC_OTCH,pFD_ROJD,pFP_SEX,pFC_PHONE,pFC_FAX,pFC_EMAIL,pFC_HTTP,
                   pFK_DOCVID, pFC_DOCSER,pFC_DOCNUM,pFC_DOCVIDAN,pFD_DOCDATE,
                   pFC_RABOTA, pFK_COMPANY, pFK_OTDEL, pFK_DOLGNOST, pFC_ROJDPLACE,
                   pFL_PRIVIT, pFK_PACVID, pFL_PAYPLACE, pFK_STOLID;
  CLOSE cMain;
--Get IB
  pFK_IB:=asu.GET_IB(pFK_ID);
  IF pFK_IB='/' or pFK_IB IS NULL THEN
    -- Установим номер док-та обслуживания
    nDocObslID:=Set_NewIBNum(pFK_USLVIDID,nTemp);
    pFK_IB:=nTemp||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');
  END IF; --last edit

--Get People info
/*  OPEN cPepl;
  FETCH cPepl INTO pFC_FAM,pFC_IM,pFC_OTCH,pFD_ROJD,pFP_SEX,pFC_PHONE,pFC_FAX,pFC_EMAIL,pFC_HTTP,
                   pFK_DOCVID,pFC_DOCSER,pFC_DOCNUM,pFC_DOCVIDAN,pFD_DOCDATE,pFC_RABOTA;
--                   pFK_TOWNID,pFK_COUNTRYID,pFK_REGIONID,pFC_ADR;
  CLOSE cPepl;
*/
--Info from epidanamnezzz...
  OPEN cEpid;
  FETCH cEpid INTO pFD_PRIB,pFP_TRAN,pFK_REIS,pFC_FROM,pFL_ALERG,pFL_MET_ROP;
  CLOSE cEpid;
  pFL_KUR:=GET_PACKUR(pFK_ID);
  if pFL_KUR>1 then
    pFL_KUR:=1;
  elsif pFL_KUR IS NULL then
    pFL_KUR:=0;
  end if;
  pFL_HRAP:=GET_PACHRAP(pFK_ID);
  if pFL_HRAP IS NULL then
    pFL_HRAP:=0;
  end if;
END;
/

SHOW ERRORS;


