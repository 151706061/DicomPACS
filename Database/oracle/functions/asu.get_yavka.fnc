DROP FUNCTION ASU.GET_YAVKA
/

--
-- GET_YAVKA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_YAVKA" 
return number
is
begin
  return 285;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_YAVKA TO PUBLIC
/

