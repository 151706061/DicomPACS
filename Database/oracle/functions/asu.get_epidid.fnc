DROP FUNCTION ASU.GET_EPIDID
/

--
-- GET_EPIDID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_EPIDID" 
return number
is
begin
  return 2625;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_EPIDID TO PUBLIC
/

