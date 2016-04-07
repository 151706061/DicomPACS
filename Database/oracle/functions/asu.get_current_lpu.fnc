DROP FUNCTION ASU.GET_CURRENT_LPU
/

--
-- GET_CURRENT_LPU  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_CURRENT_LPU" return number
is --возвращает ИД ЛПУ (TCOMPANY.FK_ID), в которой установлена МИС
   --by A.Nakorjakov 021008
begin
  return 15093;
end;
/

SHOW ERRORS;


