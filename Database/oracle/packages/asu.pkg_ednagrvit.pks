DROP PACKAGE ASU.PKG_EDNAGRVIT
/

--
-- PKG_EDNAGRVIT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_EDNAGRVIT" 
IS
--
-- Purpose: Отчет о загрузке по ФТ единицам в виде
/*
-------------------------------------------------------------------------------------------------------
|№ п.п.| Процедура | Первичные (чел.) | Повторные (чел.) | Всего проц | ФТ Ед. | На 1 чел. | % охвата |
-------------------------------------------------------------------------------------------------------
|      |           |                  |                  |            |        |           |          |
*/
-- Sobjanin A.A. sobjanin_alex@chat.ru
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------

  FUNCTION DoEdNagrVit (pFD1 IN DATE, pFD2 IN DATE)
    RETURN CLOB;
END;-- Package Specification PKG_EDNAGRVIT
/

SHOW ERRORS;


