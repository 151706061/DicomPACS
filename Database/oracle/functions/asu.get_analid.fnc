DROP FUNCTION ASU.GET_ANALID
/

--
-- GET_ANALID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANALID" 
return number
is
begin
  return 1321;
end;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_ANALID
/

--
-- GET_ANALID  (Synonym) 
--
--  Dependencies: 
--   GET_ANALID (Function)
--
CREATE SYNONYM BUH.GET_ANALID FOR ASU.GET_ANALID
/


GRANT EXECUTE ON ASU.GET_ANALID TO PUBLIC
/

