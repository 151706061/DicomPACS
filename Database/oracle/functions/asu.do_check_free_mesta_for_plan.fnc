DROP FUNCTION ASU.DO_CHECK_FREE_MESTA_FOR_PLAN
/

--
-- DO_CHECK_FREE_MESTA_FOR_PLAN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   GET_PALATAMESTA (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_CHECK_FREE_MESTA_FOR_PLAN" -- Created by TimurLan
 (pFK_PACID IN NUMBER, pFK_PALATAID IN NUMBER, pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
 RETURN NUMBER
IS
 CURSOR cWhoIs
  IS SELECT /*+ rule*/fd_data1, fd_data2
       FROM TPERESEL
      WHERE FK_PALATAID=pFK_PALATAID
        AND FK_PACID <> pFK_PACID
        AND((pFD_DATA1 >= FD_DATA1 AND pFD_DATA1 <= FD_DATA2)
         OR (pFD_DATA2 >= FD_DATA1 AND pFD_DATA2 <= FD_DATA2)
         OR (pFD_DATA1 <= FD_DATA1 AND pFD_DATA2 >= FD_DATA2));
 CURSOR cTemp (nFD_DATA DATE)
  IS SELECT /*+ rule*/COUNT(TPERESEL.FK_ID)
       FROM TPERESEL
      WHERE FK_PALATAID=pFK_PALATAID
        AND FK_PACID <> pFK_PACID
        AND nFD_DATA BETWEEN FD_DATA1 AND FD_DATA2;
  nCurrent NUMBER;
  nTotal NUMBER;
  nResult NUMBER;
BEGIN
  SELECT GET_PALATAMESTA(pFK_PALATAID) INTO nTotal FROM DUAL;
  nResult:=nTotal;
  FOR p IN cWhoIs LOOP
--  WHILE nFD_DATA < TRUNC(pFD_DATA2,'MI') LOOP
    OPEN cTemp(p.FD_DATA1);
    FETCH cTemp INTO nCurrent;
    CLOSE cTemp;
    if ((p.FD_DATA1 >= pFD_DATA1) OR (p.FD_DATA1 <= pFD_DATA2)) AND (nResult > nTotal-nCurrent)
      then nResult:=nTotal-nCurrent;
    end if;
    EXIT WHEN nResult <= 0;
    OPEN cTemp(p.FD_DATA2);
    FETCH cTemp INTO nCurrent;
    CLOSE cTemp;
    if ((p.FD_DATA2 >= pFD_DATA1) OR (p.FD_DATA2 <= pFD_DATA2)) AND (nResult > nTotal-nCurrent)
      then nResult:=nTotal-nCurrent;
    end if;
    EXIT WHEN nResult <= 0;
  END LOOP;
  RETURN nResult;
END;
/

SHOW ERRORS;


