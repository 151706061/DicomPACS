DROP PACKAGE ASU.PKGMEDKART
/

--
-- PKGMEDKART  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMEDKART (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGMEDKART" 
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam       18-01-2001
  CURSOR cGetByID (pFK_ID IN NUMBER)
  IS
    SELECT fc_name, fc_comment, fk_medicid, fk_apostavshikid, fd_goden, fc_serial
      FROM tmedkart
     WHERE fk_id = pFK_ID;
  PROCEDURE GetByID (pfc_name OUT VARCHAR2, pfc_comment OUT VARCHAR2, pfk_medicid OUT NUMBER, pfk_apostavshikid OUT NUMBER, fd_goden out date, fc_serial out varchar2, pFK_ID IN NUMBER);
  FUNCTION DoSet (pfc_name IN VARCHAR2, pfc_comment IN VARCHAR2, pfk_medicid IN NUMBER, pfk_apostavshikid IN NUMBER, pfd_goden in date, pfc_serial in varchar2, pFK_ID IN NUMBER DEFAULT -1)
    RETURN NUMBER;
  PROCEDURE DoDel (pFK_ID IN NUMBER);
  FUNCTION GetRashUch (pFK_ID IN NUMBER, pFD_DATE1 IN DATE, pFD_DATE2 IN DATE, pFK_POSTAVSHIKID IN NUMBER)
    RETURN NUMBER;

  FUNCTION GetOstUch (pFK_ID IN NUMBER, pFD_DATE IN DATE, pFK_POSTAVSHIKID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GetNameByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2;

  FUNCTION GetSerialByID (pFK_ID IN NUMBER)
    RETURN VARCHAR2;

  FUNCTION GetUchEdIzm (pFK_ID IN NUMBER)
    RETURN NUMBER;
END;-- Package Specification PKGMEDKART
/

SHOW ERRORS;


