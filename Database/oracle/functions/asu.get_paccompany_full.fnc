DROP FUNCTION ASU.GET_PACCOMPANY_FULL
/

--
-- GET_PACCOMPANY_FULL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOMPANY (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_paccompany_full
-- Created by TimurLan
-- 20061030 modified by Serg
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  strTemp VARCHAR2(255);
  CURSOR cTemp IS SELECT FC_SHORT FROM TCOMPANY WHERE FK_ID=pFK_ID;
BEGIN
  if pFK_ID>0 then
    OPEN cTemp;
    FETCH cTemp INTO strTemp;
    CLOSE cTemp;
  else
    RETURN NULL;
  end if;
  RETURN strTemp;
END;
/

SHOW ERRORS;


