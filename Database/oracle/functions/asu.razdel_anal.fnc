DROP FUNCTION ASU.RAZDEL_ANAL
/

--
-- RAZDEL_ANAL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."RAZDEL_ANAL" 
return number
is 
begin
  return 1321;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.RAZDEL_ANAL TO PUBLIC
/

