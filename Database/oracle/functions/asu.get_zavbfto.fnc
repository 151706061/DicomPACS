DROP FUNCTION ASU.GET_ZAVBFTO
/

--
-- GET_ZAVBFTO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_ZAVBFTO" 
return number
is
begin
  return 1209;
end;
/

SHOW ERRORS;


DROP SYNONYM STAT.GET_ZAVBFTO
/

--
-- GET_ZAVBFTO  (Synonym) 
--
--  Dependencies: 
--   GET_ZAVBFTO (Function)
--
CREATE SYNONYM STAT.GET_ZAVBFTO FOR ASU.GET_ZAVBFTO
/


