DROP FUNCTION ASU.GET_DOIID
/

--
-- GET_DOIID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DOIID" 
return number
is
begin
  return 392;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_DOIID TO PUBLIC
/

