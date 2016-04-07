DROP FUNCTION ASU.IS_FCPUT_MORE_ZERO
/

--
-- IS_FCPUT_MORE_ZERO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."IS_FCPUT_MORE_ZERO" (nValue IN VARCHAR2) -- Created by TimurLan
  RETURN NUMBER
IS
 nTemp NUMBER;
BEGIN
  nTemp := 1;
  begin
  if nValue is null
    OR
     TO_NUMBER(nValue) = 0
  then
    nTemp := 0;
  end if;
  exception
    when others then null;
  end;
  RETURN nTemp;
END;
/

SHOW ERRORS;


