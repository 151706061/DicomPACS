DROP FUNCTION ASU.GET_COC_POL
/

--
-- GET_COC_POL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COC_POL" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  --CURSOR cTemp IS SELECT /*+ rule*/FC_NAME FROM TCOC_POL WHERE FK_ID=pFK_ID;
  -- Changed by Nefedov S.M. 23.06.2006
  CURSOR cTemp IS SELECT substr(fc_name,1,100) FROM  tsmid where FK_ID = pFK_ID;
  strTemp VARCHAR2(100);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO strTemp;
  CLOSE cTemp;
  RETURN strTemp;
END;
/

SHOW ERRORS;


