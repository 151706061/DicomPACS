DROP FUNCTION ASU.GET_SL_GIVER
/

--
-- GET_SL_GIVER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOMPANY (Table)
--   TSLINFO (Table)
--   TSLPERIOD (Table)
--   GET_SOTRNAME (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SL_GIVER" (pfk_slperiodid IN NUMBER) RETURN VARCHAR2 IS
  -- Created 20060914 by Serg
  -- Возвращает врача, продлившего период нетрудоспособности, если врача нет, возвращает организацию
CURSOR C
IS
  SELECT MAX(GET_SOTRNAME(P.FK_SOTRID)) SOTR
         FROM TSLPERIOD P
         WHERE P.FK_ID = pfk_slperiodid;

CURSOR C1
IS
  SELECT MAX(C.FC_NAME)
         FROM TSLPERIOD P,
              TCOMPANY C
         WHERE P.FK_ID = pfk_slperiodid
         AND C.FK_ID = P.FK_ORGID;

CURSOR C2
IS
  SELECT MAX(C.FC_NAME)
         FROM TSLINFO I,
              TCOMPANY C
         WHERE I.FK_ID = (SELECT MAX(P.FK_SLINFOID)
                                 FROM TSLPERIOD P
                                 WHERE P.FK_ID = pfk_slperiodid)
         AND C.FK_ID = I.FK_ORGID;

  D VARCHAR2(32767);

BEGIN
-- Врач
 OPEN C;
  FETCH C INTO D;
 CLOSE C;
-- Если врача нет - берем организацию из TSLPERIOD
 IF D IS NULL THEN
  OPEN C1;
   FETCH C1 INTO D;
  CLOSE C1;
 END IF;
-- Если в TSLPERIOD нет организации - берем организацию из TSLINFO (для старых ЛН)
 IF D IS NULL THEN
  OPEN C2;
   FETCH C2 INTO D;
  CLOSE C2;
 END IF;

 RETURN D;

 EXCEPTION
 WHEN OTHERS THEN  RETURN '';

END;
/

SHOW ERRORS;


