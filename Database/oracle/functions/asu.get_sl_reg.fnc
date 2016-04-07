DROP FUNCTION ASU.GET_SL_REG
/

--
-- GET_SL_REG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLPERIOD (Table)
--   TSMID (Table)
--   GET_SHORT_RUS_WORD (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_REG" (pfk_slinfoid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060828 by Serg
-- Функция возвращает перечень сокращенных режимов по листку нетрудоспособности
CURSOR c
IS
  SELECT DISTINCT
--           SUBSTR(S.FC_NAME, 1, 3) FC_NAME
         S.FC_NAME
         FROM TSMID S,
              TSLPERIOD P
         WHERE S.FK_ID = P.FK_REGIMENID
         AND P.FK_SLINFOID = pfk_slinfoid
         ORDER BY FC_NAME;
  D VARCHAR2(32767);
BEGIN
FOR I IN C LOOP
 IF D IS NULL THEN
  D := GET_SHORT_RUS_WORD(I.FC_NAME, 3);
 ELSE
  D := D || ' + ' ||GET_SHORT_RUS_WORD(I.FC_NAME, 3);
 END IF;
END LOOP;
 RETURN D;
END;
/

SHOW ERRORS;


