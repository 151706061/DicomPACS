DROP FUNCTION ASU.GET_NAZCITO
/

--
-- GET_NAZCITO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZCITO" return number is
begin
 return 2;
 end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_NAZCITO TO PUBLIC
/

