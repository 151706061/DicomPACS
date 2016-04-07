DROP FUNCTION ASU.GET_COUNT_PACPUTS
/

--
-- GET_COUNT_PACPUTS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TPUTS (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNT_PACPUTS" 
(pFC_PUT IN VARCHAR2, pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER IS
  CURSOR c IS
    SELECT/*+ rule*/ COUNT (TPUTS.FK_PACID)
      FROM TPUTS, TSROKY
     WHERE FC_PUT = pFC_PUT
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


