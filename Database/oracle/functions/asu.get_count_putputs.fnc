DROP FUNCTION ASU.GET_COUNT_PUTPUTS
/

--
-- GET_COUNT_PUTPUTS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TPUTS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_PUTPUTS" (pFK_PACID IN NUMBER, pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER IS
  CURSOR c IS
    SELECT/*+ rule*/ COUNT (FC_PUT)
      FROM TPUTS, TSROKY
     WHERE TSROKY.FK_PACID = pFK_PACID
       AND TSROKY.FK_PACID = TPUTS.FK_PACID
       AND FK_PRYB = 2
       AND TRUNC(FD_DATA1) BETWEEN pFD_DATA1 AND pFD_DATA2;
  I NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN I;
END;                                                                                                                                                                       -- Function GET_COUNT_PUTPUTS
/

SHOW ERRORS;


