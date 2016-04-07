DROP FUNCTION ASU.GET_VRACHNAGR
/

--
-- GET_VRACHNAGR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   TMP_PACAGES (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_VRACHNAGR" (
  pFK_VRACHID   IN   NUMBER
 ,pFD_DATA1     IN   DATE
 ,pFD_DATA2     IN   DATE
 ,pFN_AGE1      IN   NUMBER DEFAULT 0
 ,pFN_AGE2      IN   NUMBER DEFAULT 2000
 ,pResLech1     IN   NUMBER DEFAULT 0
 ,pResLech2     IN   NUMBER DEFAULT 4
)
  RETURN NUMBER
IS
--
--
-- Purpose: Сколько пациентов ведет заданный врач(терапевт) на дату
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
--  Sam         03.02.2001
  res   NUMBER;

  CURSOR cNagr (
    pFK_VRACHID   IN   NUMBER
   ,pFD_DATA1     IN   DATE
   ,pFD_DATA2     IN   DATE
   ,pFN_AGE1      IN   NUMBER DEFAULT 0
   ,pFN_AGE2      IN   NUMBER DEFAULT 2000
   ,pResLech1     IN   NUMBER DEFAULT 0
   ,pResLech2     IN   NUMBER DEFAULT 4
  )
  IS
    SELECT COUNT (tmp_pacages.FK_pacID)
      FROM (SELECT DISTINCT fk_pacid
              FROM tperesel
             WHERE TRUNC (pFD_DATA1) BETWEEN fd_data1 AND fd_data2
                OR TRUNC (pFD_DATA2 + 1) BETWEEN fd_data1 AND fd_data2) qPeresel
          ,tmp_pacages
     WHERE FK_VRACHID = pFK_VRACHID
       AND tmp_pacages.fn_age BETWEEN pFN_AGE1 AND pFN_AGE2
       AND tmp_pacages.fk_pacid = qPeresel.fk_pacid
       AND fp_reslech BETWEEN pResLech1 AND pResLech2;
BEGIN
  OPEN cNagr (pFK_VRACHID, pFD_DATA1, pFD_DATA2, pFN_AGE1, pFN_AGE2, pResLech1, pResLech2);
  FETCH cNagr INTO res;
  CLOSE cNagr;
  RETURN res;
END GET_VRACHNAGR;                                                                             -- Function GET_VRACHNAGR
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


