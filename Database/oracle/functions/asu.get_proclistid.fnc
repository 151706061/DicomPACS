DROP FUNCTION ASU.GET_PROCLISTID
/

--
-- GET_PROCLISTID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PROCLISTID" 
return number
is
begin
  return 80;
end;
/

SHOW ERRORS;


