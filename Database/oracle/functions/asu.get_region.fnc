DROP FUNCTION ASU.GET_REGION
/

--
-- GET_REGION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TREGION (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_REGION" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  strTemp VARCHAR2(100);
  CURSOR cTemp IS SELECT /*+ rule*/ FC_NAME FROM TREGION WHERE FK_ID=pFK_ID;
BEGIN
  if pFK_ID=0 then
    RETURN NULL;
  else
    OPEN cTemp;
    FETCH cTemp INTO strTemp;
    CLOSE cTemp;
  end if;
  RETURN strTemp;
END;
/

SHOW ERRORS;


