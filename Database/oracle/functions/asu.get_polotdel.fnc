DROP FUNCTION ASU.GET_POLOTDEL
/

--
-- GET_POLOTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_POLOTDEL" RETURN NUMBER
IS
-- Created 20060905 by Serg
-- Возвращает код ветки "ПОЛИКЛИНИКИ"
BEGIN
  Return 21469;
END;
/

SHOW ERRORS;


