DROP FUNCTION ASU.TMP_GET_SEX
/

--
-- TMP_GET_SEX  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TMP_GET_SEX" (pFC_VALUE IN VARCHAR2) return NUMBER
 is
  Result NUMBER;
  nTemp BINARY_INTEGER;
begin
  IF pFC_VALUE = 'ì' THEN
    return 1;
  elsif pFC_VALUE = 'æ' then
    return 0;
  else
    return -1;
  end if;
end;
/

SHOW ERRORS;


