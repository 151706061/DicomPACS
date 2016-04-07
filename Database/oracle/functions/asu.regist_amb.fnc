DROP FUNCTION ASU.REGIST_AMB
/

--
-- REGIST_AMB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   SET_NEWIBNUM (Function)
--   TGROUP (Table)
--   TVIDDOC (Table)
--   TCOUNTRY (Table)
--   TOTDEL_TYPEDOC (Table)
--   TADRESS (Table)
--   TADRTYPE (Table)
--   TAMBULANCE (Table)
--   TRAION (Table)
--   TTOWN (Table)
--   TINTOWN (Table)
--   TPEOPLES (Table)
--   TREGION (Table)
--   PKG_SMINI (Package)
--   GET_VRACHOTD (Function)
--   GET_YEARWORK (Function)
--   TUSLVID (Table)
--   TSTREET (Table)
--   TPRIZN (Table)
--
CREATE OR REPLACE FUNCTION ASU."REGIST_AMB"(pFK_PEPLID IN INTEGER,
                                            FK_VRACHID IN INTEGER)
  RETURN NUMBER IS
  nTemp        NUMBER;
  PFK_USLVIDID INTEGER;
  PFK_ID       INTEGER;
  NDOCOBSLID   INTEGER;
  NADRID       INTEGER;
BEGIN
  SELECT MAX(TUSLVID.fk_id)
    INTO pFK_USLVIDID
    FROM TUSLVID, totdel_typedoc
   WHERE FL_DEFAULT = 1
     AND totdel_typedoc.fk_typedoc = tuslvid.fk_id
     AND totdel_typedoc.fk_otdelid = GET_VRACHOTD(FK_VRACHID)
     AND RowNum = 1;

  INSERT INTO tambulance
    (FK_ID)
  VALUES
    (pFK_ID)
  RETURNING FK_ID INTO pFK_ID;

  -- ”становим номер док-та обслуживани€
  nDocObslID := Set_NewIBNum(pFK_USLVIDID, nTemp);
  UPDATE tambulance
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
  IF PKG_SMINI.READSTRING('CONFIG', 'B_USE_DEFAULT', 0) = 1 THEN
    SELECT COUNT(FK_ID) INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
    IF nTemp = 1 THEN
      SELECT FK_ID INTO nTemp FROM TVIDDOC WHERE FL_DEFAULT = 1;
      UPDATE TPeoples SET Fk_Docvid = CASE WHEN COALESCE(Fk_Docvid, -1) = -1 THEN nTemp ELSE Fk_Docvid END  WHERE FK_ID = pFK_PEPLID;
    END IF;
    SELECT COUNT(FK_ID) INTO nTemp FROM TGROUP WHERE FL_DEFAULT = 1;
    IF nTemp = 1 THEN
      SELECT FK_ID INTO nTemp FROM TGROUP WHERE FL_DEFAULT = 1;
      UPDATE tambulance SET FK_GROUPID = nTemp WHERE FK_ID = pFK_ID;
    END IF;
    SELECT COUNT(FK_ID) INTO nTemp FROM TPRIZN WHERE FL_DEFAULT = 1;
    IF nTemp = 1 THEN
      SELECT FK_ID INTO nTemp FROM TPRIZN WHERE FL_DEFAULT = 1;
      UPDATE tambulance SET FK_PRIZN = nTemp WHERE FK_ID = pFK_ID;
    END IF;
    SELECT COUNT(FK_ID) INTO nTemp FROM TADRTYPE WHERE FL_DEFAULT = 1;
    IF nTemp = 1 THEN
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
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TCOUNTRY WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_COUNTRYID = nTemp WHERE FK_ID = nAdrID;
        END IF;
        SELECT COUNT(FK_ID) INTO nTemp FROM TREGION WHERE FL_DEFAULT = 1;
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TREGION WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_REGIONID = nTemp WHERE FK_ID = nAdrID;
        END IF;
        SELECT COUNT(FK_ID) INTO nTemp FROM TTOWN WHERE FL_DEFAULT = 1;
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TTOWN WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_TOWNID = nTemp WHERE FK_ID = nAdrID;
        END IF;
        SELECT COUNT(FK_ID) INTO nTemp FROM TRAION WHERE FL_DEFAULT = 1;
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TRAION WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_RAIONID = nTemp WHERE FK_ID = nAdrID;
        END IF;
        SELECT COUNT(FK_ID) INTO nTemp FROM TINTOWN WHERE FL_DEFAULT = 1;
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TINTOWN WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_INTOWNID = nTemp WHERE FK_ID = nAdrID;
        END IF;
        SELECT COUNT(FK_ID) INTO nTemp FROM TSTREET WHERE FL_DEFAULT = 1;
        IF nTemp = 1 THEN
          SELECT FK_ID INTO nTemp FROM TSTREET WHERE FL_DEFAULT = 1;
          UPDATE TADRESS SET FK_STREETID = nTemp WHERE FK_ID = nAdrID;
        END IF;
      END IF;
    END IF;
  END IF;
  RETURN pFK_ID;
END;
/

SHOW ERRORS;


