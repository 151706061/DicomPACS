DROP FUNCTION ASU.GET_NAZPLAN
/

--
-- GET_NAZPLAN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZPLAN" 
return number
is 
begin
  return 323575;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_NAZPLAN TO PUBLIC
/

