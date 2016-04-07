DROP FUNCTION ASU.GET_MEDICID
/

--
-- GET_MEDICID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_MEDICID" 
return number
is
begin
  return 1;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_MEDICID TO PUBLIC
/

