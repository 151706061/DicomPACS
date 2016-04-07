DROP FUNCTION ASU.GET_KEKOTDEL
/

--
-- GET_KEKOTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_KEKOTDEL" RETURN NUMBER
IS
-- Created 20061004 by Serg
-- Возвращает код ветки "Клинико-экспертное отделение"
BEGIN
  Return 20886;
END;
/

SHOW ERRORS;


