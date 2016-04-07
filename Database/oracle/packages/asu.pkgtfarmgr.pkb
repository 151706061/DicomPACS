DROP PACKAGE BODY ASU.PKGTFARMGR
/

--
-- PKGTFARMGR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGTFARMGR" 
IS
/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfc_comment IN VARCHAR2,pFK_ID IN NUMBER default -1)
   IS
   BEGIN
      if pFK_ID=-1 then
      INSERT INTO tfarmgr
                  (fc_name, fc_comment)
           VALUES (pFC_NAME, pfc_comment);
      else
         UPDATE tfarmgr
            SET fc_name = pFC_NAME,
                fc_comment = pfc_comment
         where fk_id=pFK_ID;
      end if;
   END DoSet;

/*------------------------------------------------------------------------------------------------------------------*\
|               isExistsMedic
\*------------------------------------------------------------------------------------------------------------------*/
   FUNCTION isExistsMedic (pFK_ID IN NUMBER)
      RETURN NUMBER
   IS
      nTmp   ROWID;
      nRes number;
   BEGIN
      OPEN cChekMedic (pfk_id);
      FETCH cChekMedic INTO nTmp;
      IF cChekMedic%rowcount = 0 THEN
         nRes:=0;
      ELSE
         nRes:=1;
      END IF;
      close cChekMedic;
      return nRes;
   END isExistsMedic;

/*------------------------------------------------------------------------------------------------------------------*\
|               DoDel
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoDel (pfk_id IN NUMBER)
   IS
      nTmp   ROWID;
   BEGIN
      DELETE
        FROM tfarmgr
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
        FROM tmedic
       WHERE fk_farmgrID = pFK_ID;

      DELETE
        FROM tfarmgr
       WHERE fk_id = pFK_ID;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetByID
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE GetByID (pfk_id IN NUMBER, pFC_NAME OUT VARCHAR2, pfc_comment OUT VARCHAR2)
   IS
   BEGIN
      OPEN cGetByID (pFK_ID);
      FETCH cGetByID INTO pFC_NAME, pfc_comment;
      CLOSE cGetByID;
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         CLOSE cGetByID;
      WHEN OTHERS THEN
         RAISE;
   END;
END PKGtfarmgr;
/

SHOW ERRORS;


