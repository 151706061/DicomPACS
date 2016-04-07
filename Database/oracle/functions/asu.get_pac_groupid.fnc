DROP FUNCTION ASU.GET_PAC_GROUPID
/

--
-- GET_PAC_GROUPID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_GROUPID" (pFK_INKARTA IN NUMBER, pFK_INPEOPLES IN NUMBER) return NUMBER is
  Result NUMBER;
begin
  if pFK_INKARTA > 0 then
    Result := pFK_INKARTA;
  else
    Result := pFK_INPEOPLES;
  end if;
  return(Result);
end GET_PAC_GROUPID;
/

SHOW ERRORS;


