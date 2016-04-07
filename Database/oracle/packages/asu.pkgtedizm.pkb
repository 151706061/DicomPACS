DROP PACKAGE BODY ASU.PKGTEDIZM
/

--
-- PKGTEDIZM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKGTEDIZM" 
IS
/*------------------------------------------------------------------------------------------------------------------*\
|               DoSet
\*------------------------------------------------------------------------------------------------------------------*/
   PROCEDURE DoSet (pFC_NAME IN VARCHAR2, pfc_comment IN VARCHAR2, pFK_ID IN NUMBER DEFAULT -1)
   IS
   BEGIN
      IF pFK_ID = -1 THEN
         INSERT INTO tedizm
                     (fc_name, fc_comment)
              VALUES (pFC_NAME, pfc_comment);
      ELSE
         UPDATE tedizm
            SET fc_name = pFC_NAME,
                fc_comment = pfc_comment
          where fk_id=pFK_ID;
      END IF;
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
        FROM tedizm
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
       WHERE fk_uchedizmID = pFK_ID
          OR fk_fasedizmID = pFK_ID;

      DELETE
        FROM tedizm
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
      WHEN OTHERS THEN
         CLOSE cGetByID;
   END;

/*------------------------------------------------------------------------------------------------------------------*\
|               GetNameByID
\*------------------------------------------------------------------------------------------------------------------*/
   function GetNameByID (pFK_ID in number)   return varchar2
   is
    pFC_NAME VARCHAR2(255);
    pfc_comment VARCHAR2(4000);
   begin
     GetByID(pFK_ID, pFC_NAME, pFC_COMMENT);
     return pFC_NAME;
   end;
END PKGtedizm;
/

SHOW ERRORS;


