DROP FUNCTION ASU.GET_SL_DISAB
/

--
-- GET_SL_DISAB  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLPERIOD (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_DISAB" (pfk_slinfoid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060828 by Serg
-- Функция возвращает последнюю строку нетрудоспособности для листка
CURSOR C
IS
  SELECT S.FC_NAME||' '||NVL(D.FC_NAME, ' ')||RTRIM(' '||P.FC_DISABILITY)
         FROM TSMID S,
              TSMID D,
              TSLPERIOD P
         WHERE S.FK_ID = P.FK_DISABILITYID
         AND D.FK_ID(+) = P.FK_RELATIVE
         AND P.FK_SLINFOID = pfk_slinfoid
         AND P.FD_BEGIN = (SELECT MAX(FD_BEGIN)
                                  FROM TSLPERIOD
                                  WHERE FK_SLINFOID = pfk_slinfoid);

  D VARCHAR2(32767);

BEGIN
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;
/

SHOW ERRORS;


