DROP FUNCTION ASU.GET_PEJIMID
/

--
-- GET_PEJIMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PEJIMID" 
return number
is 
begin
  return 259858;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_PEJIMID TO PUBLIC
/

