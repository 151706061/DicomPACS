DROP FUNCTION ASU.REGIST_AMB_USLVID
/

--
-- REGIST_AMB_USLVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SET_NEWIBNUM (Function)
--   TGROUP (Table)
--   TVIDDOC (Table)
--   TCOUNTRY (Table)
--   TADRESS (Table)
--   TADRTYPE (Table)
--   TAMBULANCE (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TPEOPLES (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   GET_YEARWORK (Function)
--   TSTREET (Table)
--   TPRIZN (Table)
--
CREATE OR REPLACE FUNCTION ASU.REGIST_AMB_USLVID(pFK_PEPLID in Integer,
                                        pFK_USLVIDID in number)
  RETURN NUMBER IS
  nTemp        NUMBER;
  PFK_ID       Integer;
  NDOCOBSLID   Integer;
  NADRID       Integer;
begin

  INSERT INTO tambulance
    (FK_ID)
  values
    (pFK_ID)
  RETURNING FK_ID INTO pFK_ID;

  -- ”становим номер док-та обслуживани€
  nDocObslID := Set_NewIBNum(pFK_USLVIDID, nTemp);
  Update tambulance
     SET FK_IBID    = nTemp,
         FK_IBY     = TO_CHAR(GET_YEARWORK),
         FK_PEPLID  = pFK_PEPLID,
         FK_DOCOBSL = nDocObslID
   WHERE FK_ID = pFK_ID;
  FOR C IN (SELECT FC_FAM, FC_IM, FC_OTCH, FD_ROJD, FP_SEX
              FROM ASU.TPEOPLES
             WHERE FK_ID = pFK_PEPLID) LOOP
    UPDATE TAMBULANCE
       SET FC_FAM  = C.FC_FAM,
           FC_IM   = C.FC_IM,
           FC_OTCH = C.FC_OTCH,
           FD_ROJD = c.FD_ROJD,
           FP_SEX  = C.FP_SEX
     WHERE FK_ID = pFK_ID;
  END LOOP;
  -- ≈сли в настройках регистратуры указано устанавливать значени€ по умолчанию, то установим их
  if PKG_SMINI.READSTRING('CONFIG', 'B_USE_DEFAULT', 0) = 1 then
    SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
    if nTemp = 1 then
      SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
      Update TPeoples set Fk_Docvid = nTemp WHERE FK_ID = pFK_PEPLID;
    end if;
    SELECT COUNT(FK_ID) INTO nTemp FROM TGROUP WHERE FL_DEFAULT = 1;
    if nTemp = 1 then
      SELECT FK_ID INTO nTemp FROM TGROUP WHERE FL_DEFAULT = 1;
      Update tambulance set FK_GROUPID = nTemp WHERE FK_ID = pFK_ID;
    end if;
    SELECT COUNT(FK_ID) INTO nTemp FROM TPRIZN WHERE FL_DEFAULT = 1;
    if nTemp = 1 then
      SELECT FK_ID INTO nTemp FROM TPRIZN WHERE FL_DEFAULT = 1;
      Update tambulance set FK_PRIZN = nTemp WHERE FK_ID = pFK_ID;
    end if;
    SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT = 1;
    if nTemp = 1 then
      SELECT COUNT(FK_ID)
        INTO nTemp
        FROM TADRESS
       WHERE FK_PACID = pFK_PEPLID;
      IF nTemp = 0 THEN
        SELECT FK_ID INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT = 1;
        INSERT INTO TADRESS
          (FK_TYPE, FK_PACID)
        VALUES
          (nTemp, pFK_PEPLID)
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
      END IF;
    end if;
  end if;
  RETURN pFK_ID;
end;
/

SHOW ERRORS;


