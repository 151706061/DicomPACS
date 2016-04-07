DROP FUNCTION ASU.GET_EMPTYINLOT
/

--
-- GET_EMPTYINLOT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABLOT_ACCUM (Table)
--   TLABLOT_PARAM (Table)
--   TLABREG_ACCUM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_EMPTYINLOT" (pFK_ID IN NUMBER) RETURN  NUMBER IS
    CURSOR cCOUNT IS SELECT NVL(MIN(FN_LEVEL), -1)
           FROM (SELECT LEVEL FN_LEVEL FROM dual CONNECT BY LEVEL <= (SELECT NVL(FN_HEIGHT * FN_WIDTH, 0) FN_COUNT 
                                                                      FROM TLABLOT_ACCUM T2,
                                                                           TLABLOT_PARAM T3
                                                                      WHERE T2.FK_LOTACCUM = T3.FK_ID
                                                                            AND T2.FK_SOS = 0    
                                                                            AND T2.FK_ID = pFK_ID) )
           WHERE FN_LEVEL NOT IN (select FN_PROBE FROM TLABREG_ACCUM WHERE FK_LOT_ACCUME = pFK_ID);
    nRes NUMBER;
BEGIN 
    OPEN cCOUNT;
    FETCH cCOUNT INTO nRES;
    CLOSE cCOUNT;
    RETURN nREs;
END;
/

SHOW ERRORS;


