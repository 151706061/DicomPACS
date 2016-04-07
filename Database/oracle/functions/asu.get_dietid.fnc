DROP FUNCTION ASU.GET_DIETID
/

--
-- GET_DIETID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIETID" 
return number
is 
begin
  return 42310;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_DIETID TO PUBLIC
/

