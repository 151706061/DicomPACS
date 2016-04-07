DROP PACKAGE ASU.PKG_MEDGURNALS
/

--
-- PKG_MEDGURNALS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDGURNALS" 
IS
--
-- Purpose: Сбор отчетов:
--      1. журнал дефектур (замечаний по ведению истории болезни)
--      2. журнал консультаций
--      3. список людей противопоказанных к лечению по диагнозу
--      4. журнал выдачи медикаментов
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Собянин А.А.
  -- Enter package declarations as shown below
--   журнал дефектур (замечаний по ведению истории болезни)
-- возвращает код клоба в котором лежит отчет
  FUNCTION DoDefekt (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;
--  журнал консультаций
-- возвращает код клоба в котором лежит отчет
  FUNCTION DoKOnsZavOtd (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;
--  список людей противопоказанных к лечению по диагнозу
-- возвращает код клоба в котором лежит отчет
  FUNCTION DoProtivPac (FD1 IN DATE, FD2 IN DATE)
    RETURN NUMBER;

--  Журнал выдачи медикаментов по процедурному кабинету "наименование кабинет"
  FUNCTION DoMedVyd (FD1 IN DATE, FD2 IN DATE, pFK_APOSTAVSHIKID number)
    RETURN NUMBER;
END;   -- Package Specification PKG_MEDGURNALS
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


