DROP PACKAGE BODY ASU.PKGTAPOSTAVSHIK
/

--
-- PKGTAPOSTAVSHIK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGTAPOSTAVSHIK" 
IS
/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pFC_FULLNAME IN VARCHAR2, pFK_ID IN NUMBER DEFAULT -1)
  IS
  BEGIN
    IF pFK_ID = -1 THEN
      INSERT INTO TAPOSTAVSHIK (fc_name, fc_fullname)
           VALUES (pFC_NAME, pFC_FULLNAME);
    ELSE
      UPDATE TAPOSTAVSHIK
         SET fc_name = pFC_NAME,
             fc_fullname = pFC_FULLNAME
       WHERE fk_id = pFK_ID;
    END IF;
  END DoSet;

/*------------------------------------------------------------------------------------------------------------------*\
|               isExistsAPrih
\*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION isExistsAPrih (pFK_ID IN NUMBER)
    RETURN NUMBER
  IS
    nTmp   ROWID;
    nRes   NUMBER;
  BEGIN
    IF cChekAPrih%ISOPEN THEN
      CLOSE cChekAPrih;
    END IF;
    OPEN cChekAPrih (pfk_id);
    FETCH cChekAPrih INTO nTmp;
    IF cChekAPrih%rowcount = 0 THEN
      nRes := 0;
    ELSE
      nRes := 1;
    END IF;
    CLOSE cChekAPrih;
    RETURN nRes;
  END isExistsAPrih;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDel
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoDel (pfk_id IN NUMBER)
  IS
  BEGIN
    DELETE
      FROM TAPOSTAVSHIK
     WHERE fk_id = pFK_ID;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDelCascade
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoDelCascade (pfk_id IN NUMBER)
  IS
    nTmp   ROWID;
  BEGIN
    DELETE
      FROM taprih
     WHERE fk_APOSTAVSHIKID = pFK_ID;
    DELETE
      FROM TAPOSTAVSHIK
     WHERE fk_id = pFK_ID;
  END DoDelCascade;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetByID
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pFC_FULLNAME OUT VARCHAR2)
  IS
  BEGIN
    OPEN cGetByID (pFK_ID);
    FETCH cGetByID INTO pFC_NAME, pFC_FULLNAME;
    CLOSE cGetByID;
  EXCEPTION
    WHEN OTHERS THEN
      CLOSE cGetByID;
  END GetByID;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetNameByID
\*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION GetNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2
  IS
    pFC_NAME       VARCHAR2(255);
    pFC_FULLNAME   VARCHAR2(4000);
  BEGIN
    getByID (pFK_ID, pFC_NAME, pFC_FULLNAME);
    RETURN pFC_NAME;
  END;
END PKGTAPOSTAVSHIK;
/

SHOW ERRORS;


