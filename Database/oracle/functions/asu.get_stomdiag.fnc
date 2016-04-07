DROP FUNCTION ASU.GET_STOMDIAG
/

--
-- GET_STOMDIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_STOMDIAG" 
return number
is
begin
  return 60783;
end;
/

SHOW ERRORS;


