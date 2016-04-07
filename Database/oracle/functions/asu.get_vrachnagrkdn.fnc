DROP FUNCTION ASU.GET_VRACHNAGRKDN
/

--
-- GET_VRACHNAGRKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVRACH (Table)
--   GET_PACAGEONVYB (Function)
--   GET_PACDAYS (Function)
--   IS_PAC_LIVE_IN_PERIOD (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_VRACHNAGRKDN" (pFK_VRACHID IN NUMBER, pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFN_AGE1 IN NUMBER DEFAULT 0, pFN_AGE2 IN NUMBER DEFAULT 2000)
  RETURN NUMBER
IS
--
--
-- Purpose: Сколько койкодней прожили пациенты которых ведет заданный врач(терапевт) на дату
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
--  Sam         03.02.2001
  res   NUMBER;

  CURSOR cNagr (pFK_VRACHID IN NUMBER, pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFN_AGE1 IN NUMBER DEFAULT 0, pFN_AGE2 IN NUMBER DEFAULT 2000)
  IS
    SELECT   /*+ RULE*/SUM (GET_PACDAYS (FK_pacID))
      FROM TVRACH
     WHERE FK_VRACHID = pFK_VRACHID
       AND FL_VID = 'M'
       AND IS_PAC_LIVE_IN_PERIOD (FK_PACID, pFD_DATA1, pFD_DATA2) = 1
       AND get_pacageonvyb (FK_PACID) BETWEEN pFN_AGE1 AND pFN_AGE2;
BEGIN
  OPEN cNagr (pFK_VRACHID, pFD_DATA1, pFD_DATA2, pFN_AGE1, pFN_AGE2);
  FETCH cNagr INTO res;
  CLOSE cNagr;
  RETURN res;
END GET_VRACHNAGRKDN;   -- Function GET_VRACHNAGR
/

SHOW ERRORS;


