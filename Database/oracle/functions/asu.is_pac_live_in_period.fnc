DROP FUNCTION ASU.IS_PAC_LIVE_IN_PERIOD
/

--
-- IS_PAC_LIVE_IN_PERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_LIVE_IN_PERIOD" 
  ( pFK_PACID IN NUMBER,pFD_DATA1 IN DATE,pFD_DATA2 IN DATE)
  RETURN  NUMBER IS
--
-- To modify this template, edit file FUNC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the function
--фхк кх векнбей б оепхнде??
--1-YES,2-NO
-- MODIFICATION HISTORY
  CURSOR c IS SELECT /*+first_row*/COUNT(DISTINCT FK_PACID) FROM TSROKY
                     WHERE
                       (FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60) OR
                       FD_DATA3 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60) OR
                       pFD_DATA1 BETWEEN FD_DATA1 AND FD_DATA3 OR
                       pFD_DATA2+1-1/(24*60*60) BETWEEN FD_DATA1 AND FD_DATA3)
                       AND FK_PRYB IN(2,4,5,6) AND
                       FK_PACID=pFK_PACID;
  i NUMBER;
BEGIN
  IF C%ISOPEN THEN
    CLOSE C;
  END IF;
  OPEN C;
  FETCH C INTO I;
  CLOSE C;
  RETURN I;
END;
/

SHOW ERRORS;


DROP SYNONYM FOOD.IS_PAC_LIVE_IN_PERIOD
/

--
-- IS_PAC_LIVE_IN_PERIOD  (Synonym) 
--
--  Dependencies: 
--   IS_PAC_LIVE_IN_PERIOD (Function)
--
CREATE SYNONYM FOOD.IS_PAC_LIVE_IN_PERIOD FOR ASU.IS_PAC_LIVE_IN_PERIOD
/


