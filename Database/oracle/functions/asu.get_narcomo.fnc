DROP FUNCTION ASU.GET_NARCOMO
/

--
-- GET_NARCOMO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_NARCOMO" 
return number
is 
begin
  return 165;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_NARCOMO TO PUBLIC
/

