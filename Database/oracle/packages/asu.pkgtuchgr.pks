DROP PACKAGE ASU.PKGTUCHGR
/

--
-- PKGTUCHGR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TUCHGR (Table)
--   TMEDIC (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTUCHGR" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR cGetByID (pFK_ID IN NUMBER)
   IS
      SELECT fc_name, fc_comment, fl_otch
        FROM TuchGR
       WHERE fk_id = pFK_ID;

   CURSOR cChekMedic (pFK_ID IN NUMBER)
   IS
      SELECT ROWID
        FROM tMEDIC
       where fk_uchGRid = pfk_id;

/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
   function isExistsMedic(pFK_ID in number) return number ;

   PROCEDURE DoDelCascade (pfk_id IN NUMBER);

   PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfc_comment IN VARCHAR2,pfl_otch in number, pFK_ID IN NUMBER default -1);

   PROCEDURE DoDel (pfk_id IN NUMBER);

   PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pfc_comment OUT VARCHAR2, pfl_otch out number);
END PKGTuchGR;
/

SHOW ERRORS;


