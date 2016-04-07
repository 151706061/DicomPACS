DROP FUNCTION ASU.GET_SNILS_3332
/

--
-- GET_SNILS_3332  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU.GET_SNILS_3332 (vSNILS IN VARCHAR2)
  RETURN  varchar2
DETERMINISTIC
IS
---Возврат СНИЛС в виде xxx-xxx-xxx xx
  vRet        VARCHAR2(14);
  vTempStr    VARCHAR2(20);
--  vRightChar  VARCHAR2(12);
BEGIN
  vRet := '';
--  vTempStr := REPLACE(vSNILS, ' ');
--  vTempStr := REPLACE(vTempStr, '-');
  vTempStr := REPLACE(REPLACE(vSNILS, ' '), '-');

  IF LENGTH(vTempStr) = 11
  THEN
     BEGIN
       vRet := SUBSTR(vTempStr,1,3) || '-' || SUBSTR(vTempStr,4,3) || '-' || SUBSTR(vTempStr,7,3) || ' ' || SUBSTR(vTempStr,10,2);
     END;
  END IF;

  RETURN vRet;
END GET_SNILS_3332;
/

SHOW ERRORS;


