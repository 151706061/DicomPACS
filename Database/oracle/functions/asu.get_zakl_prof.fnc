DROP FUNCTION ASU.GET_ZAKL_PROF
/

--
-- GET_ZAKL_PROF  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ZAKL_PROF" 
return number
is
begin
  return get_synid('GET_ZAKL_PROF');
end;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_ZAKL_PROF TO PUBLIC
/

