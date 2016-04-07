DROP FUNCTION ASU.GET_KUR_BY_CODE
/

--
-- GET_KUR_BY_CODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_KUR_BY_CODE" 
  ( pIn IN NUMBER)
  RETURN  VARCHAR2 IS
BEGIN
  if pIn>0 then
    return 'Курит';
  else
    return '';
  end if;
END;
/

SHOW ERRORS;


