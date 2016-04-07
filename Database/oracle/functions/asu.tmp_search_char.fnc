DROP FUNCTION ASU.TMP_SEARCH_CHAR
/

--
-- TMP_SEARCH_CHAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TMP_SEARCH_CHAR" (value in varchar2) return number is
  Result number;
begin
  result := INSTR(UPPER(value),'¨');
  return(Result);
end TMP_SEARCH_CHAR;
/

SHOW ERRORS;


