-- Start of DDL Script for Package Body MED.PKGTMO
-- Generated 23.05.08 15:57:46 from MED@ASU

CREATE OR REPLACE 
PACKAGE     med.pkgtmo
IS

-- Интерфейс к таблице TMO
-- Автор Собянин А.А. sobjanin_alex@chat.ru
--
   PROCEDURE sel (
      moid_in       IN  tmo.moid%TYPE,
      fc_name_out   OUT tmo.fc_name%TYPE,
      fl_crm_in     OUT tmo.fl_crm%TYPE,
      pfk_sotrid    OUT tmo.fk_sotrid%TYPE,
      fl_treb_out   OUT tmo.fl_treb%TYPE
   );


   FUNCTION doset (
      moid_in      IN   tmo.moid%TYPE,
      fc_name_in   IN   tmo.fc_name%TYPE,
      fl_crm_in    IN   tmo.fl_crm%TYPE,
      pFk_Parent   IN   tmo.fk_parent%TYPE,
      pFk_SotrId   IN   tmo.fk_sotrid%TYPE,
      pTrebWorks   IN   tmo.fl_treb%TYPE
   )
      RETURN NUMBER;
   PROCEDURE del (moid_in IN tmo.moid%TYPE);



   FUNCTION GetNameByID (moid_in IN tmo.moid%TYPE)
      RETURN tmo.fc_name%TYPE;

	procedure set_view_all_groups(p_moid integer);
	procedure drop_view_all_groups(p_moid integer);
	function is_veiw_all(p_moid integer) return pls_integer;
 FUNCTION GET_PRODUCE_POSTAV_TMO RETURN NUMBER;
--получение MOID ПОСТАВЩИКА ИЗ TMO, который производит медикаменты
  FUNCTION IsMOProvisor (P_MOID IN NUMBER)
      RETURN NUMBER;
  function DoInsertMOGroup(pFK_PARENTID INTEGER ) return number;
  
  -- есть ли еще группы МО(кроме текущей) с таким же названием
  function CheckMOGroupName( pCurMOGroupId med.TMO_GROUP.GROUPID%type,
    pFC_GROUP med.TMO_GROUP.FC_GROUP%type ) return INTEGER;
END;
/


CREATE OR REPLACE 
PACKAGE BODY     med.pkgtmo
IS

   PROCEDURE sel (
      moid_in       IN  tmo.moid%TYPE,
      fc_name_out   OUT tmo.fc_name%TYPE,
      fl_crm_in     OUT tmo.fl_crm%TYPE,
      pfk_sotrid    OUT tmo.fk_sotrid%TYPE,
      fl_treb_out   OUT tmo.fl_treb%TYPE
   )
   IS
   BEGIN
      SELECT fc_name, fl_crm, fk_sotrid, fl_treb
      INTO   fc_name_out, fl_crm_in, pfk_sotrid, fl_treb_out
      FROM   tmo
      WHERE  moid = moid_in;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN NULL;
   END;

   FUNCTION doset (
      moid_in      IN   tmo.moid%TYPE,
      fc_name_in   IN   tmo.fc_name%TYPE,
      fl_crm_in    IN   tmo.fl_crm%TYPE,
      pFk_Parent   IN   tmo.fk_parent%TYPE,
      pFk_SotrId   IN   tmo.fk_sotrid%TYPE,
      pTrebWorks   IN   tmo.fl_treb%TYPE
   )
      RETURN NUMBER
   IS
      nRes   NUMBER;
--      PRAGMA AUTONOMOUS_TRANSACTION;
   BEGIN
      nRes := moid_in;

      UPDATE tmo
      SET   fc_name = NVL (fc_name_in, fc_name),
            fl_crm = NVL (fl_crm_in, fl_crm),
            Fk_Parent = decode(pFk_Parent, null, Fk_Parent, -1, fk_parent, pFk_Parent),
            fk_sotrid = nvl(pFk_sotrid,fk_sotrid),
			         fl_treb = pTrebWorks
      WHERE  moid = moid_in;

      IF SQL%NOTFOUND THEN
         INSERT INTO tmo (moid, fc_name, fl_crm,fk_parent,fk_sotrid,fl_treb)
         VALUES      (moid_in, fc_name_in, fl_crm_in, decode(pFk_Parent, -1, null, pFk_Parent), pFk_sotrid, pTrebWorks)
         RETURNING   moid INTO nRes;
      END IF;
--      COMMIT;
      RETURN nRes;
   END;

   PROCEDURE del (moid_in IN tmo.moid%TYPE)
   IS
      PRAGMA AUTONOMOUS_TRANSACTION;

   iCnt NUMBER;
   BEGIN

      SELECT COUNT(0) INTO iCnt FROM TMO T
      CONNECT BY PRIOR MOID = FK_PARENT
      START WITH MOID = moid_in;

      IF iCnt > 1 THEN --есть у Мат ответственного детки
        RAISE_APPLICATION_ERROR('Нельзя удалять МО если есть подчиненые!',-20001);
      END IF;

      DELETE FROM tmo_tuchgrtype
      WHERE moid = moid_in;

      DELETE FROM tmo
      WHERE       moid = moid_in;

      COMMIT;
   END;

   FUNCTION GetNameByID (moid_in IN tmo.moid%TYPE)
      RETURN tmo.fc_name%TYPE
   IS
      CURSOR c (lmoid IN tmo.moid%TYPE)
      IS
         SELECT fc_name
         FROM   tmo
         WHERE  tmo.moid = lmoid;

      res   tmo.fc_name%TYPE;
   BEGIN
      FOR i IN c (moid_in) LOOP
         res := i.fc_name;
      END LOOP;

      RETURN res;
   END GetNameByID;

   FUNCTION IsMOProvisor (P_MOID IN NUMBER)
      RETURN NUMBER
   IS
      res NUMBER;
   BEGIN
      SELECT NVL(MAX(TMO.FL_TREB), -1)
      INTO res
      FROM (SELECT FL_TREB FROM MED.TMO WHERE TMO.MOID = P_MOID) TMO;

      RETURN res; -- -1 - МО не найден, 0 - это медсестра, 1 - это провизор
   END IsMOProvisor;

	procedure set_view_all_groups(p_moid integer)
	is
	begin
		delete from tmo_tuchgrtype t
		where t.moid = p_moid;

		insert into tmo_tuchgrtype(moid, fk_tuchgrtype)
		select p_moid, tt.fl_mat
		from tuchgr tt;
	end;

	procedure drop_view_all_groups(p_moid integer)
	is
	begin
		delete from tmo_tuchgrtype t
		where t.moid = p_moid;
	end;

	function is_veiw_all(p_moid integer) return pls_integer
	is
		m pls_integer;
		n pls_integer;
	begin
/*		select count(1) into n
		from tmo_tuchgrtype mu
		where mu.moid ;
*/
SELECT COUNT (FK_TUCHGRTYPE)
  INTO n
  FROM
   (SELECT DISTINCT MU.FK_TUCHGRTYPE
    	FROM TMO_TUCHGRTYPE MU
   		WHERE MU.MOID = p_moid
   );

SELECT COUNT(FK_ID)
  INTO M
  FROM
   (SELECT DISTINCT FK_ID	FROM TUCHGRTYPE UT);

/*		select count(1) into m
		from tuchgrtype ut;
*/
		if m != n then
			return 0;
		else
			return 1;
		end if;
	end;


-- DEEMARIC
PROCEDURE InsInTMO IS
pragma autonomous_transaction;
BEGIN
  INSERT INTO TMO
  (MOID,
   FC_NAME,
   FL_CRM,
   FK_PARENT,
   FK_SOTRID,
   FL_TREB,
   FN_MOTYPE)
  VALUES
  (null,
   'Отдел РПО',
   0,
   0,
   -1,
   0,
   1);
commit;
END;


FUNCTION GET_PRODUCE_POSTAV_TMO
--получение MOID ПОСТАВЩИКА ИЗ TMO, который производит медикаменты
   RETURN NUMBER
IS
 pragma autonomous_transaction;
 vMOID NUMBER :=-1;

BEGIN
SELECT
    NVL(MAX(MOID),-1)
  INTO
    vMOID
  FROM TMO
  WHERE FN_MOTYPE = 1;

IF vMOID=-1 THEN

--НЕ НАШЛИ ПОСТАВЩИКА, КОТОРЫЙ производит медикаменты => его надо добавить в таблицу TMO

INSERT INTO TMO
  (MOID,
   FC_NAME,
   FL_CRM,
   FK_PARENT,
   FK_SOTRID,
   FL_TREB,
   FN_MOTYPE)
  VALUES
  (null,
   'Отдел РПО',
   0,
   0,
   -1,
   0,
   1) returning MOID into vMOID;
commit; 
--InsInTMO;

/*SELECT
    NVL(MAX(MOID),-1)
  INTO
    vMOID
  FROM TMO
  WHERE FN_MOTYPE = 1;*/
END IF;

   RETURN vMOID;
END GET_PRODUCE_POSTAV_TMO;

  function DOINSERTMOGROUP(pFK_PARENTID INTEGER ) return number
  is  
    vGroupId med.TMO_GROUP.GROUPID%type;
    vFK_PARENTID med.TMO_GROUP.FK_PARENTID%type;
  begin                                         
    if (pFK_PARENTID > 0) then
      vFK_PARENTID := pFK_PARENTID;
    else
      vFK_PARENTID := null;
    end if;
    
    insert into med.TMO_GROUP (FK_PARENTID)
    values ( vFK_PARENTID ) returning GROUPID into vGroupId;
    
    return vGroupId;
  end;  
          
  /* > 0 - есть совпадения, 0 - нет совпадений */
  function CHECKMOGROUPNAME( pCurMOGroupId med.TMO_GROUP.GROUPID%type, 
    pFC_GROUP med.TMO_GROUP.FC_GROUP%type ) return INTEGER
  is                                         
    vRes INTEGER;
  begin                                        
    select count(1)
      into vRes
      from med.TMO_GROUP g
     where upper(trim(g.FC_GROUP)) = upper(trim(pFC_GROUP))
       and g.GROUPID <> pCurMOGroupId;
     
    return vRes; 
  end;

end;
/


-- End of DDL Script for Package Body MED.PKGTMO

