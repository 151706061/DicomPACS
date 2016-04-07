DROP FUNCTION ASU.TMP_REPLACE_SVID
/

--
-- TMP_REPLACE_SVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TMP_REPLACE_SVID" (pFC_VALUE IN VARCHAR2) return VARCHAR2
 is
  Result VARCHAR2(32767);
  nTemp BINARY_INTEGER;
begin
  Result := pFC_VALUE;
  IF Result IS NULL THEN
    return Null;
  end if;
  LOOP
    EXIT WHEN INSTR (Result,'св.')=0;
    Result := REPLACE (Result,'св.','');
  END LOOP;
  return(Result);
end;
/

SHOW ERRORS;


