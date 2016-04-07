DROP FUNCTION ASU.GET_TYPEORDER
/

--
-- GET_TYPEORDER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_TYPEORDER" 
  ( sType IN VarChar2)
  RETURN  varchar2 IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
   -- Declare program variables as shown above
BEGIN
  if sType='TEXT' then
    return 0;
  else
  if sType='PICTURE' then
    return 1;
  else
  if sType='VIDEO' then
    return 2;
  else
    raise_application_error(-20002, 'Неподдерживаемый тип данных');
  end if  ;
  end if  ;
  end if  ;
END;
/

SHOW ERRORS;


