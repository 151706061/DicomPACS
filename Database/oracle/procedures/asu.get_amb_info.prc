DROP PROCEDURE ASU.GET_AMB_INFO
/

--
-- GET_AMB_INFO  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SET_NEWIBNUM (Function)
--   TGROUP (Table)
--   TIB (Table)
--   TVIDDOC (Table)
--   TCOUNTRY (Table)
--   TADRESS (Table)
--   TADRTYPE (Table)
--   TAMBULANCE (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TPEOPLES (Table)
--   TSMID (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   GET_IB (Function)
--   TUSLVID (Table)
--   TSTREET (Table)
--   TPRIZN (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_AMB_INFO" (pFK_ID      IN OUT NUMBER,
                                         pFK_PEPLID  OUT NUMBER,
  -- LastUpdated : 28.10.2003 by TimurLan
                                         pFC_FAM     OUT VARCHAR2,
                                         pFC_IM      OUT VARCHAR2,
                                         pFC_OTCH    OUT VARCHAR2,
                                         pFK_IB      OUT VARCHAR2,
                                         pFD_ROJD    OUT DATE,
                                         pFK_GROUPID OUT NUMBER,
                                         pFK_PRIZN   OUT NUMBER,
                                         pFP_SEX     OUT NUMBER,
                                         pFC_ADR     OUT VARCHAR2,
                                         pFC_RABOTA  OUT VARCHAR2,
                                         pFC_PHONE   OUT VARCHAR2,
                                         pFC_RECOM   OUT VARCHAR2,
                                         pFL_VOV     OUT NUMBER,
                                         pFL_IVOV    OUT NUMBER,
                                         pFL_ULA     OUT NUMBER,
                                         pFK_USLVIDID IN OUT NUMBER,/*Added by KOsov 13.05.2010*/
                                         pFK_VIDOBSL OUT NUMBER/*Added by KOsov 13.05.2010*/) IS
  CURSOR cData IS
    SELECT TAMBULANCE.FC_FAM,
           TAMBULANCE.FC_IM,
           TAMBULANCE.FC_OTCH,
           GET_IB(TAMBULANCE.FK_ID),
           TAMBULANCE.FD_ROJD,
           TAMBULANCE.FK_GROUPID,
           TAMBULANCE.FK_PRIZN,
           TAMBULANCE.FP_SEX,
           TAMBULANCE.FC_ADR,
           TAMBULANCE.FC_RABOTA,
           TAMBULANCE.FC_PHONE,
           TAMBULANCE.FC_RECOM,
           TAMBULANCE.FL_VOV,
           TAMBULANCE.FL_IVOV,
           TAMBULANCE.FL_ULA,
           NVL(TAMBULANCE.FK_PEPLID,-1)
      FROM TAMBULANCE
     WHERE TAMBULANCE.FK_ID=pFK_ID;
  CURSOR cPacExists IS SELECT /*+ first_row*/COUNT(FK_ID) FROM TAMBULANCE WHERE FK_ID=pFK_ID;
  -- Added by Kosov 13.05.2010
  CURSOR cVidObsl(pPeop in number) IS select fk_smid from tib t where t.fk_pacid = pPeop and t.fk_smeditid = (select fk_id
                                                                                                                from tsmid s
                                                                                                               where s.fc_synonim = 'AMBTALON_OPL');
  -- End Add

  nTemp NUMBER;
  nAdrID NUMBER;
  nDocObslID NUMBER; -- Added by Kosov 13.05.2010
  pFK_IB2 VARCHAR2(4000); -- Added by Kosov 12.07.2010
BEGIN
  OPEN cPacExists;
  FETCH cPacExists INTO nTemp;
  CLOSE cPacExists;

  if nTemp>1 then
    raise_application_error(-2004,'Ошибка! Найдено более одного пациента с одинаковым идентификационным номером!');
  end if;

  if nTemp = 0 then
  -- Added by Kosov 13.05.2010
    if pFK_USLVIDID = 0 or pFK_USLVIDID = -1 or pFK_USLVIDID is null then
      SELECT FK_ID into pFK_USLVIDID from TUSLVID where FL_DEFAULT = 1 and RowNum =1;      
    end if;
  -- End Add

    insert into tambulance (fk_id) values (-1) returning fk_id into pFK_ID;
    Insert into TPeoples (Fc_Fam) values (NULL) RETURNING FK_ID INTO pFK_PEPLID;
   
  -- Added by Kosov 13.05.2010
    nDocObslID:=asu.SET_NewIBNum(pFK_USLVIDID,nTemp);
    pFK_IB2:=nTemp||'/'||TO_CHAR(TRUNC(SYSDATE),'YYYY');
  -- End Add

    SELECT FK_ID INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
    INSERT INTO TADRESS (FK_TYPE,FK_PACID) VALUES (nTemp,pFK_PEPLID) RETURNING FK_ID INTO nAdrID;
    Update tambulance SET FK_PEPLID = pFK_PEPLID WHERE FK_ID = pFK_ID;
    if PKG_SMINI.READSTRING ('CONFIG', 'B_USE_DEFAULT', 0) = 1 then
      SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT=1;
        Update TPeoples set Fk_Docvid = nTemp WHERE FK_ID = pFK_PEPLID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TGROUP WHERE FL_DEFAULT=1;
        Update tambulance set FK_GROUPID = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
      if nTemp = 1 then
        SELECT FK_ID INTO nTemp FROM TPRIZN WHERE FL_DEFAULT=1;
        Update tambulance set FK_PRIZN = nTemp WHERE FK_ID = pFK_ID;
      end if;
      SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT=1;
      if nTemp = 1 then
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
  end if;


  open cData;
  fetch cData
    into pFC_FAM, pFC_IM, pFC_OTCH, pFK_IB, pFD_ROJD, pFK_GROUPID, pFK_PRIZN, pFP_SEX, pFC_ADR, pFC_RABOTA, pFC_PHONE, pFC_RECOM, pFL_VOV, pFL_IVOV, pFL_ULA, pFK_PEPLID;
  close cData;
  -- Added by Kosov 13.05.2010
  if pFK_IB is null then 
    pFK_IB := pFK_IB2;
  end if;
  open cVidObsl(pFK_PEPLID);
    fetch cVidObsl into pFK_VIDOBSL;
  close cVidObsl;
  -- End Add
END;
/

SHOW ERRORS;


