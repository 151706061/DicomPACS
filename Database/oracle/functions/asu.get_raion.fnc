DROP FUNCTION ASU.GET_RAION
/

--
-- GET_RAION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRAION (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_RAION" -- Created by TimurLan
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  strTemp VARCHAR2(30);
-- Commented by Serg 20070228  CURSOR cTemp IS SELECT FC_NAME FROM TREGION WHERE FK_ID=pFK_ID;
  CURSOR cTemp IS SELECT FC_NAME FROM TRAION WHERE FK_ID=pFK_ID; -- Added by Serg 20070228
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


