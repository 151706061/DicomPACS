DROP FUNCTION ASU.TONUMBER
/

--
-- TONUMBER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TDISTRICT_NAME (Table)
--
CREATE OR REPLACE FUNCTION ASU."TONUMBER" (sNum in tdistrict_name.fc_name%type) return number is
  
  sValue  tdistrict_name.fc_name%type;
  nValue  number;
begin
  
  sValue := TRIM(TRANSLATE(sNum, '¹ ', '  '));
  nValue := to_number(sValue);  

  return  nValue;
 
EXCEPTION
   WHEN OTHERS THEN RETURN null;
  
end ToNumber;
/

SHOW ERRORS;


