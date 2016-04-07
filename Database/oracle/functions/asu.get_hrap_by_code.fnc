DROP FUNCTION ASU.GET_HRAP_BY_CODE
/

--
-- GET_HRAP_BY_CODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_HRAP_BY_CODE" 
  ( pIn IN NUMBER)
  RETURN  VARCHAR2 IS
BEGIN
  if pIn=1 then
    RETURN 'Храпит';
  else
    RETURN '';
  end if;
END;
/

SHOW ERRORS;


