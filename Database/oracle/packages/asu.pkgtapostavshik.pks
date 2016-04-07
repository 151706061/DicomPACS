DROP PACKAGE ASU.PKGTAPOSTAVSHIK
/

--
-- PKGTAPOSTAVSHIK  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAPOSTAVSHIK (Table)
--   TAPRIH (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTAPOSTAVSHIK" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
  CURSOR cGetByID (pFK_ID IN NUMBER)
  IS
    SELECT fc_name, fc_fullname
      FROM TAPOSTAVSHIK
     WHERE fk_id = pFK_ID;

  CURSOR cChekAPrih (pFK_ID IN NUMBER)
  IS
    SELECT ROWID
      FROM taprih
     WHERE fk_APOSTAVSHIKid = pFK_ID;

/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
  FUNCTION isExistsAprih (pFK_ID IN NUMBER)
    RETURN NUMBER;

  PROCEDURE DoDelCascade (pfk_id IN NUMBER);

  PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pFC_FULLNAME IN VARCHAR2, pFK_ID IN NUMBER DEFAULT -1);

  PROCEDURE DoDel (pfk_id IN NUMBER);

  PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pFC_FULLNAME OUT VARCHAR2);

  FUNCTION GetNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2;
END PKGTAPOSTAVSHIK;
/

SHOW ERRORS;


