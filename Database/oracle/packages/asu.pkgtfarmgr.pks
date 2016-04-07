DROP PACKAGE ASU.PKGTFARMGR
/

--
-- PKGTFARMGR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TFARMGR (Table)
--   TMEDIC (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTFARMGR" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR cGetByID (pFK_ID IN NUMBER)
   IS
      SELECT fc_name, fc_comment
        FROM Tfarmgr
       WHERE fk_id = pFK_ID;

   CURSOR cChekMedic (pFK_ID IN NUMBER)
   IS
      SELECT ROWID
        FROM tMEDIC
       where fk_farmgrid = pfk_id;

/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
   function isExistsMedic(pFK_ID in number) return number ;

   PROCEDURE DoDelCascade (pfk_id IN NUMBER);

   PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfc_comment IN VARCHAR2,pFK_ID IN NUMBER default -1);

   PROCEDURE DoDel (pfk_id IN NUMBER);

   PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pfc_comment OUT VARCHAR2);
END PKGTfarmgr;
/

SHOW ERRORS;


