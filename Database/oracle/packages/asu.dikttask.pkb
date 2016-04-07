DROP PACKAGE BODY ASU.DIKTTASK
/

--
-- DIKTTASK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."DIKTTASK" IS

/*---------------------------------------------------------------------------------------
|
|       AddTask
|
---------------------------------------------------------------------------------------*/
   PROCEDURE addtask (pfk_blobid IN NUMBER, pfk_clobid IN NUMBER, pfc_comment IN varchar2, pfk_vrachid IN NUMBER) IS
   BEGIN
      INSERT INTO tdikttasks(fk_blobid, fk_clobid, fc_comment, fk_vrachid)
           VALUES (pfk_blobid, pfk_clobid, pfc_comment, pfk_vrachid);
   END;--adtask

/*---------------------------------------------------------------------------------------
|
|       istaskexists
|
---------------------------------------------------------------------------------------*/
   FUNCTION istaskexists (pfc_comment IN VARCHAR2)
      RETURN BOOLEAN IS
      CURSOR c (pcomment IN VARCHAR2) IS
         SELECT fk_id FROM tdikttasks
          WHERE fc_comment = pcomment;
      ncount                        NUMBER:=Null;
   BEGIN
      open c(pFC_COMMENT);
      fetch c into nCount;
      if c%notfound then
         close c;
         return false;
      else
         close c;
         return true;
      end if;
   END;--istaskexists

/*---------------------------------------------------------------------------------------
|
|       deltask
|
---------------------------------------------------------------------------------------*/
   PROCEDURE deltask (pfk_id IN NUMBER) IS
   BEGIN
      DELETE FROM tdikttasks WHERE fk_id = pfk_id;
   END;--deltask

/*---------------------------------------------------------------------------------------
|
|       deltask
|
---------------------------------------------------------------------------------------*/
  PROCEDURE deltask (pfc_comment IN varchar2) is
  BEGIN
     DELETE FROM tdikttasks WHERE fc_comment = pfc_comment;
  END;--deltask
END;                                                                                                                                                                                                                                   -- Package Body DIKTTASK
/

SHOW ERRORS;


