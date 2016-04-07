DROP FUNCTION ASU.GET_NEVIP
/

--
-- GET_NEVIP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_NEVIP"
return number DETERMINISTIC
is
begin
  return 2;
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_NEVIP TO PUBLIC
/

