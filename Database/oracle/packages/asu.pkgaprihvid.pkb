DROP PACKAGE BODY ASU.PKGAPRIHVID
/

--
-- PKGAPRIHVID  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGAPRIHVID" 
IS
/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfp_vid IN NUMBER, pFK_APPID IN NUMBER, pFK_ID IN NUMBER DEFAULT -1)
  IS
    nAPPID   NUMBER;
  BEGIN
    IF    pFK_APPID = -1
       OR pFK_APPID IS NULL THEN
      nAPPID := NULL;
    ELSE
      nAppID := pFK_APPID;
    END IF;
    IF pFK_ID = -1 THEN
      INSERT INTO taprihvid (fc_name, fp_vid, FK_APPID)
           VALUES (pFC_NAME, pfp_vid, nAPPID);
      COMMIT;
--      raise_application_error(-20003,'Now inserting ....');

    ELSE
      UPDATE taprihvid
         SET fc_name = pFC_NAME,
             fp_vid = pfp_vid,
             FK_APPID = nAPPID
       WHERE fk_id = pFK_ID;
    END IF;
  END DoSet;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDel
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoDel (pfk_id IN NUMBER)
  IS
    nTmp   ROWID;
  BEGIN
    DELETE
      FROM taprihvid
     WHERE fk_id = pFK_ID;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetByID
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pFK_APPID OUT NUMBER, pfp_vid OUT NUMBER)
  IS
  BEGIN
    OPEN cGetByID (pFK_ID);
    FETCH cGetByID INTO pFC_NAME, pfp_vid, pFK_APPID;
    CLOSE cGetByID;
  EXCEPTION
    WHEN OTHERS THEN
      CLOSE cGetByID;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetNameByID
\*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION GetNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2
  IS
    pFC_NAME    VARCHAR2(255);
    pfp_vid     VARCHAR2(4000);
    pFK_APPID   NUMBER;
  BEGIN
    GetByID (pFK_ID, pFC_NAME, pfp_vid, pFK_APPID);
    RETURN pFC_NAME;
  END;
END PKGaprihvid;
/

SHOW ERRORS;


