DROP PACKAGE BODY ASU.PKGTRECEPTCON
/

--
-- PKGTRECEPTCON  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGTRECEPTCON" 
IS
/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoSet (pfk_medicid in number, pfk_receptid  in number, pfn_kol in number, pFK_ID IN NUMBER default -1)
   IS
   BEGIN
      IF pFK_ID = -1 THEN
         INSERT INTO treceptcon
                     (fk_medicid, fk_receptid, fn_kol)
              VALUES (pfk_medicid, pfk_receptid, pfn_kol);
      ELSE
         UPDATE treceptcon
            SET fk_medicid=pfk_medicid,
            fk_receptid=pfk_receptid,
            fn_kol=pfn_kol
          where fk_id=pFK_ID;
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
        FROM treceptcon
       WHERE fk_id = pFK_ID;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetByID
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE GetByID (pfk_id IN NUMBER, pfk_medicid out number, pfk_receptid  out number, pfn_kol out number )
   IS
   BEGIN
      OPEN cGetByID (pFK_ID);
      FETCH cGetByID INTO pfk_medicid, pfk_receptid, pfn_kol;
      CLOSE cGetByID;
   EXCEPTION
      WHEN OTHERS THEN
         CLOSE cGetByID;
   END;

END PKGtreceptcon;
/

SHOW ERRORS;


