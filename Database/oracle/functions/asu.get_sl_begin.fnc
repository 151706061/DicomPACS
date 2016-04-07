DROP FUNCTION ASU.GET_SL_BEGIN
/

--
-- GET_SL_BEGIN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLPERIOD (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_BEGIN" (pfk_slinfoid IN NUMBER) RETURN DATE IS
-- Сreated 20060828 by Serg
-- Функция возвращает начало листка нетрудоспособности
CURSOR C
IS
  SELECT MIN(FD_BEGIN)
         FROM TSLPERIOD P
         WHERE FK_SLINFOID = pfk_slinfoid
         AND FL_DEL = 0;

  D DATE;

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


