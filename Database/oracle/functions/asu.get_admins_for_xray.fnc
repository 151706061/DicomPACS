DROP FUNCTION ASU.GET_ADMINS_FOR_XRAY
/

--
-- GET_ADMINS_FOR_XRAY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMINI (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ADMINS_FOR_XRAY" (PFK_SOTR NUMBER)
  RETURN NUMBER IS
  
  CURSOR cAdm IS SELECT COUNT(*) 
                   FROM ASU.TSMINI
                  WHERE FC_SECTION = 'XRAY'
                    AND FC_KEY = 'ÏÐÀÂÀ_ÀÄÌÈÍÈÑÒÐÀÒÎÐÀ_'||TO_CHAR(PFK_SOTR)
                    AND FC_VALUE = TO_CHAR(PFK_SOTR); 
  
  nRes NUMBER;
  nCnt NUMBER;
  
BEGIN 
  OPEN cAdm;
  FETCH cAdm INTO nCnt;
  CLOSE cAdm;
  
  IF nCnt > 0 THEN
    nRes := 1;
  ELSE
    nRes := 0;
  END IF;    
  
  RETURN nRes;
END;
/

SHOW ERRORS;


