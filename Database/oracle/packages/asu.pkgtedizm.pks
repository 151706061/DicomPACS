DROP PACKAGE ASU.PKGTEDIZM
/

--
-- PKGTEDIZM  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TEDIZM (Table)
--   TMEDIC (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTEDIZM" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR cGetByID (pFK_ID IN NUMBER)
   IS
      SELECT fc_name, fc_comment
        FROM tedizm
       WHERE fk_id = pFK_ID;

   CURSOR cChekMedic (pFK_ID IN NUMBER)
   IS
      SELECT ROWID
        FROM TMEDIC
       where fk_uchedizmid = pfk_id or fk_fasedizmid=pFK_ID;

/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
   function isExistsMedic(pFK_ID in number) return number ;

   PROCEDURE DoDelCascade (pfk_id IN NUMBER);

   PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfc_comment IN VARCHAR2, pFK_ID IN NUMBER default -1);

   PROCEDURE DoDel (pfk_id IN NUMBER);

   PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pfc_comment OUT VARCHAR2);

    function GetNameByID (pFK_ID in number)   return varchar2;

END PKGtedizm;
/

SHOW ERRORS;


