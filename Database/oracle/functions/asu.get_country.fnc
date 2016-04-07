DROP FUNCTION ASU.GET_COUNTRY
/

--
-- GET_COUNTRY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOUNTRY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTRY" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  strTemp VARCHAR2(100);
  CURSOR cTemp IS SELECT /*+ rule*/ FC_NAME FROM TCOUNTRY WHERE FK_ID=pFK_ID;
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


