DROP FUNCTION ASU.GET_PERSON
/

--
-- GET_PERSON  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PERSON" 
return number
is
begin
  return 89454;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_PERSON TO PUBLIC
/

