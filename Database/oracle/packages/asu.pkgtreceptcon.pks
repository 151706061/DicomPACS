DROP PACKAGE ASU.PKGTRECEPTCON
/

--
-- PKGTRECEPTCON  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRECEPTCON (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKGTRECEPTCON" 
IS
/*-------------------------------------------------------------------------------------------*\
|               Cursors
\*-------------------------------------------------------------------------------------------*/
   CURSOR cGetByID (pFK_ID IN NUMBER)
   IS
      SELECT fk_medicid, fk_receptid, fn_kol
        FROM treceptcon
       WHERE fk_id = pFK_ID;
/*-------------------------------------------------------------------------------------------*\
|               Procedures
\*-------------------------------------------------------------------------------------------*/
   PROCEDURE DoSet (pfk_medicid in number, pfk_receptid  in number, pfn_kol in number, pFK_ID IN NUMBER default -1);

   PROCEDURE DoDel (pfk_id IN NUMBER);

   PROCEDURE GetByID (pfk_id IN NUMBER, pfk_medicid out number, pfk_receptid  out number, pfn_kol out number );
END PKGtreceptcon;
/

SHOW ERRORS;


