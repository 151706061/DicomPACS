DROP FUNCTION ASU.GET_SL_FULL_REG
/

--
-- GET_SL_FULL_REG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLPERIOD (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_FULL_REG" (pfk_slinfoid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060828 by Serg
-- Функция возвращает все режимы по листку нетрудоспособности
CURSOR C
IS
  SELECT DISTINCT S.FC_NAME
         FROM TSMID S,
              TSLPERIOD P
         WHERE S.FK_ID = P.FK_REGIMENID
         AND P.FK_SLINFOID = pfk_slinfoid
  ORDER BY FC_NAME;

  D VARCHAR2(32767);

BEGIN
FOR I IN C LOOP
 IF D IS NULL THEN
  D := I.FC_NAME;
 ELSE
  D := D || ' + ' || I.FC_NAME;
 END IF;
END LOOP;
RETURN D;
END;
/

SHOW ERRORS;


