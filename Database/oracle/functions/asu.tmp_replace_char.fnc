DROP FUNCTION ASU.TMP_REPLACE_CHAR
/

--
-- TMP_REPLACE_CHAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TMP_REPLACE_CHAR" (value in varchar2) return varchar2 is
  Result varchar2(32767);
begin
  result := REPLACE(UPPER(value),UPPER('¨'),'Å');
  return(Result);
end;
/

SHOW ERRORS;


