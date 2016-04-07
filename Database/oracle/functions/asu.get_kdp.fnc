DROP FUNCTION ASU.GET_KDP
/

--
-- GET_KDP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDP" RETURN NUMBER
IS
-- Created 20060905 by Serg
-- Возвращает код ветки отделения "Консультативно - диагностическая поликлиника"
BEGIN
  Return 100;
END;
/

SHOW ERRORS;


