DROP FUNCTION ASU.GET_COUNT_PLAN_OUT
/

--
-- GET_COUNT_PLAN_OUT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_PLAN_OUT" ( pFD_DATA IN DATE) RETURN NUMBER IS
--
-- Purpose: Количество пациентов к выписке за необходимуюдату
--
-- Person by Philip A. Milovanov
--
CURSOR cCount(pDATA DATE) IS SELECT COUNT(DISTINCT FK_ID) FROM TSROKY WHERE FD_DATA2=pDATA AND FK_PRYB IN (2,4,5,6);
 i NUMBER;
BEGIN
  OPEN cCount(pFD_DATA);
  FETCH cCount INTO i;
  CLOSE cCount;
  RETURN i;
END; -- Function GET_COUNT_PLAN_OUT
/

SHOW ERRORS;


