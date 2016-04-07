DROP FUNCTION ASU.GET_VACCINNAZID
/

--
-- GET_VACCINNAZID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_vaccinnazid return number is
begin
  return(get_synid('PROC_VACCIN'));
end;
/

SHOW ERRORS;


