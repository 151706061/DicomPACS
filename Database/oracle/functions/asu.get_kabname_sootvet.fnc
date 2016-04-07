DROP FUNCTION ASU.GET_KABNAME_SOOTVET
/

--
-- GET_KABNAME_SOOTVET  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKABINET (Table)
--   TKABSOOTVET (Table)
--   TKABSOOTVETKAB (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KABNAME_SOOTVET" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
--�������� �� ���������
CURSOR cDef IS
 SELECT
   Tkabinet.Fc_Name
 FROM Tkabinet WHERE FK_ID=pFK_ID;

CURSOR �Current IS
 SELECT
   Tkabsootvet.Fc_Name
 FROM Tkabinet,Tkabsootvetkab,Tkabsootvet
   WHERE
 Tkabsootvetkab.Fk_Kabsootvetid = Tkabsootvet.Fk_Id
   and
 Tkabsootvetkab.Fk_Kabinetid = Tkabinet.FK_ID
   and
 Tkabinet.FK_ID = pFK_ID;


str varchar2(4000);

BEGIN
  str := NULL;
  OPEN �Current;
  FETCH �Current INTO str;
  CLOSE �Current;

  if str is NULL then
   OPEN cDef;
   FETCH cDef INTO str;
   CLOSE cDef;
  end if;

  RETURN str;
END;
/

SHOW ERRORS;


