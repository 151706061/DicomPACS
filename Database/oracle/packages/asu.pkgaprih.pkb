DROP PACKAGE BODY ASU.PKGAPRIH
/

--
-- PKGAPRIH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGAPRIH" 
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam       18-01-2001
/*------------------------------------------------------------------------------------------------------------------*\
|               GetByID
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE GetByID (
    pFD_DATE            OUT      DATE,
    pFC_DOC             OUT      VARCHAR2,
    pFK_APOSTAVSHIKID   OUT      NUMBER,
    pFK_AKOMUID         OUT      NUMBER,
    pFC_COMMENT         OUT      VARCHAR2,
    pFK_APRIHVIDID      OUT      NUMBER,
    pFK_ID              IN       NUMBER
  )
  IS
  BEGIN
    FOR i IN cGetByID (pFK_ID)
    LOOP
      pFD_DATE := i.FD_DATE;
      pFC_DOC := i.FC_DOC;
      pFK_APOSTAVSHIKID := i.FK_APOSTAVSHIKID;
      pFK_AKOMUID := i.FK_AKOMUID;
      pFC_COMMENT := i.FC_COMMENT;
      pFK_APRIHVIDID := i.FK_APRIHVIDID;
    END LOOP;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION DoSet (
    pFD_DATE            IN   DATE,
    pFC_DOC             IN   VARCHAR2,
    pFK_APOSTAVSHIKID   IN   NUMBER,
    pFK_AKOMUID         IN   NUMBER,
    pFC_COMMENT         IN   VARCHAR2,
    pFK_APRIHVIDID      IN   NUMBER,
    pFK_ID              IN   NUMBER DEFAULT -1
    )
    RETURN NUMBER
  IS
    nID   NUMBER;
  BEGIN
    nID := pFK_ID;
    IF nID = -1 THEN
      INSERT INTO taprih (FK_ID, FD_DATE, FC_DOC, FK_APOSTAVSHIKID, FK_AKOMUID, FC_COMMENT, FK_APRIHVIDID)
           VALUES (NULL, pFD_DATE, pFC_DOC, pFK_APOSTAVSHIKID, pFK_AKOMUID, pFC_COMMENT, pFK_APRIHVIDID)
        RETURNING fk_id INTO nID;
    ELSE
      UPDATE taprih
         SET FD_DATE = pFD_DATE,
             FC_DOC = pFC_DOC,
             FK_APOSTAVSHIKID = pFK_APOSTAVSHIKID,
             FK_AKOMUID = pFK_AKOMUID,
             FC_COMMENT = pFC_COMMENT,
             FK_APRIHVIDID = pFK_APRIHVIDID
       WHERE fk_id = nID;
    END IF;
    RETURN nID;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDel
\*------------------------------------------------------------------------------------------------------------------*/
  PROCEDURE DoDel (pFK_ID IN NUMBER)
  IS
  BEGIN
    DELETE
      FROM taprih
     WHERE fk_id = pFK_ID;
  END;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDel
\*------------------------------------------------------------------------------------------------------------------*/
  FUNCTION getNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2
  IS
    CURSOR c (pFK_ID IN NUMBER)
    IS
      SELECT fc_doc
        FROM taprih
       WHERE fk_id = pFK_ID;

    res   taprih.fc_doc%TYPE;
  BEGIN
    FOR i IN c (pFK_ID)
    LOOP
      res := i.fc_doc;
    END LOOP;
    RETURN res;
  END;
END;   -- Package Body PKGAPRIH
/

SHOW ERRORS;


