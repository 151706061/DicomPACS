DROP FUNCTION ASU.GET_PEDICID
/

--
-- GET_PEDICID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PEDICID" 
return number
is 
begin
  return 324402;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_PEDICID TO PUBLIC
/

