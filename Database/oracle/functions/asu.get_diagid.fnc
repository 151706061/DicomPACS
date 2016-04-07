DROP FUNCTION ASU.GET_DIAGID
/

--
-- GET_DIAGID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAGID" 
return number
is 
begin
  return 319051;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_DIAGID TO PUBLIC
/

