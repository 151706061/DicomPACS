DROP FUNCTION ASU.GET_GALOBID
/

--
-- GET_GALOBID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_GALOBID" 
return number
is
begin
  return 398;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_GALOBID TO PUBLIC
/

