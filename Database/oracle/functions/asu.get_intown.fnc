DROP FUNCTION ASU.GET_INTOWN
/

--
-- GET_INTOWN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TINTOWN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_INTOWN" -- Created by TimurLan
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  strTemp VARCHAR2(30);
  CURSOR cTemp IS SELECT FC_NAME FROM TINTOWN WHERE FK_ID=pFK_ID;
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


