DROP FUNCTION ASU.GET_NEYAV
/

--
-- GET_NEYAV  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_NEYAV" 
return number
is
begin
  return 3;
end;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_NEYAV
/

--
-- GET_NEYAV  (Synonym) 
--
--  Dependencies: 
--   GET_NEYAV (Function)
--
CREATE SYNONYM BUH.GET_NEYAV FOR ASU.GET_NEYAV
/


DROP SYNONYM STAT.GET_NEYAV
/

--
-- GET_NEYAV  (Synonym) 
--
--  Dependencies: 
--   GET_NEYAV (Function)
--
CREATE SYNONYM STAT.GET_NEYAV FOR ASU.GET_NEYAV
/


GRANT EXECUTE ON ASU.GET_NEYAV TO PUBLIC
/

