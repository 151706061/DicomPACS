DROP FUNCTION ASU.GET_SESTRFLT
/

--
-- GET_SESTRFLT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SESTRFLT" 
return number
is 
begin
  return 153;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_SESTRFLT TO PUBLIC
/

