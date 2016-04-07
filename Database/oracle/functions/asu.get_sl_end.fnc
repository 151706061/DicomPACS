DROP FUNCTION ASU.GET_SL_END
/

--
-- GET_SL_END  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLPERIOD (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_END" (pfk_slinfoid IN NUMBER) RETURN DATE IS
-- Created 20060828 by Serg
-- Функция возвращает дату окончания листка нетрудоспособности
CURSOR C
IS
  SELECT MAX(P.FD_END)
  FROM ASU.TSLPERIOD P
  WHERE (P.FL_DEL <> 1 OR P.FL_DEl IS NULL)
        AND P.FD_BEGIN = (SELECT MAX(PP.FD_BEGIN)
                          FROM ASU.TSLPERIOD PP
                          WHERE PP.FK_SLINFOID = pfk_slinfoid)
        AND P.FK_SLINFOID = pfk_slinfoid;
  D DATE;
BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


