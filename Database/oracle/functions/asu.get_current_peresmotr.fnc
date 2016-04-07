DROP FUNCTION ASU.GET_CURRENT_PERESMOTR
/

--
-- GET_CURRENT_PERESMOTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_CURRENT_PERESMOTR" return varchar2 is

-- shpielevoy
-- возвращает текущий пересмотр (нужно для модуля aTOMP)

begin

  return  '45';
end get_current_peresmotr;
/

SHOW ERRORS;


