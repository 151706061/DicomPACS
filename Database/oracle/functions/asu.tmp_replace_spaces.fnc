DROP FUNCTION ASU.TMP_REPLACE_SPACES
/

--
-- TMP_REPLACE_SPACES  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TMP_REPLACE_SPACES" (pFC_VALUE IN VARCHAR2) return VARCHAR2
 is
  Result VARCHAR2(32767);
  nTemp BINARY_INTEGER;
begin
  Result := TRIM(' ' FROM pFC_VALUE);
  IF Result IS NULL THEN
    return Null;
  end if;
  LOOP
    EXIT WHEN INSTR (Result,' ')=0;
    Result := REPLACE (Result,' ','');
  END LOOP;
  return(Result);
end;
/

SHOW ERRORS;


