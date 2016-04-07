DROP FUNCTION ASU.GET_PASP_SER_22
/

--
-- GET_PASP_SER_22  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_PASP_SER_22 (vSER IN VARCHAR2)
  RETURN  VARCHAR2
IS
---Возврат серии паспорта в виде xx xx
  vRet        VARCHAR2(14);
  vTempStr    VARCHAR2(20);
  vRightChar  VARCHAR2(12);
BEGIN
  vRet := 'BAD';
  vTempStr := REPLACE(vSER, ' ');

  IF (LENGTH(REGEXP_REPLACE(vTempStr, '\D')) = 4)
  THEN
     BEGIN
       vRet := SUBSTR(vTempStr,1,2) || ' ' || SUBSTR(vTempStr,3,2);
     END;
  ELSE
     BEGIN
       vRet := vSER;
     END;
  END IF;

  RETURN vRet;
END GET_PASP_SER_22;
/

SHOW ERRORS;


