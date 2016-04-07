DROP FUNCTION ASU.GET_ISHMAO
/

--
-- GET_ISHMAO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_HMAO_REGION (Function)
--   GET_NATIVE_REGION (Function)
--
CREATE OR REPLACE FUNCTION ASU.GET_IsHMAO RETURN NUMBER IS
begin
  if asu.get_native_region = asu.get_hmao_region then
    return(1);
  else
    return(0);
  end if;
end;
/

SHOW ERRORS;


