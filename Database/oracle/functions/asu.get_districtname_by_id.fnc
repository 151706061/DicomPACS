DROP FUNCTION ASU.GET_DISTRICTNAME_BY_ID
/

--
-- GET_DISTRICTNAME_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDISTRICT (Table)
--   TDISTRICT_NAME (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DISTRICTNAME_BY_ID" (pDistrictID IN TDISTRICT.FK_ID%TYPE)
 RETURN TDISTRICT_NAME.FC_NAME%TYPE IS
-- Created 20081010 by Linnikov
-- ���������� �������� ������� �� ����
 lDistrictName TDISTRICT_NAME.FC_NAME%TYPE;
BEGIN
 IF pDistrictID = -1 THEN
  RETURN('�������� �����');
 END IF;
 IF NVL(pDistrictID, 0) = 0 THEN
  RETURN('������� �� ���������');
 END IF;
 SELECT NVL(MAX(DN.FC_NAME), '������� �� ���������')
   INTO lDistrictName
   FROM TDISTRICT D, TDISTRICT_NAME DN
  WHERE D.FK_DISTRICT = DN.FK_ID
    AND D.FK_ID = pDistrictID;
 RETURN(lDistrictName);
END GET_DISTRICTNAME_BY_ID;
/

SHOW ERRORS;


