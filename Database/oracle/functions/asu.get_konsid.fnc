DROP FUNCTION ASU.GET_KONSID
/

--
-- GET_KONSID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_KONSID" 
return number
is
begin
  return 1324;
end;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_KONSID
/

--
-- GET_KONSID  (Synonym) 
--
--  Dependencies: 
--   GET_KONSID (Function)
--
CREATE SYNONYM BUH.GET_KONSID FOR ASU.GET_KONSID
/


DROP SYNONYM STAT.GET_KONSID
/

--
-- GET_KONSID  (Synonym) 
--
--  Dependencies: 
--   GET_KONSID (Function)
--
CREATE SYNONYM STAT.GET_KONSID FOR ASU.GET_KONSID
/


GRANT EXECUTE ON ASU.GET_KONSID TO PUBLIC
/

