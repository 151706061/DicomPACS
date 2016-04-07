DROP PACKAGE ASU.PKGAPRIHVID
/

--
-- PKGAPRIHVID  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAPRIHVID (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGAPRIHVID" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
  CURSOR cGetByID (pFK_ID IN NUMBER)
  IS
    SELECT fc_name, fp_vid, fk_appid
      FROM taprihvid
     WHERE fk_id = pFK_ID;
/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfp_vid IN NUMBER, pFK_APPID in number, pFK_ID IN NUMBER DEFAULT -1);
  PROCEDURE DoDel (pfk_id IN NUMBER);
  PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pFK_APPID out number, pfp_vid OUT NUMBER);
  FUNCTION GetNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2;
END PKGaprihvid;
/

SHOW ERRORS;


