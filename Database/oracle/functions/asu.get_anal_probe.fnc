DROP FUNCTION ASU.GET_ANAL_PROBE
/

--
-- GET_ANAL_PROBE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABREG (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_PROBE" (pFK_NAZID IN BINARY_INTEGER)
  return binary_integer is
  --by TimurLan
  Result binary_integer;
begin
  for p in (SELECT FN_PROBE FROM TLABREG WHERE FK_NAZID = pFK_NAZID) loop
    Result := p.FN_PROBE;
    exit;
  end loop;
  RETURN(Result);
end;
/

SHOW ERRORS;


