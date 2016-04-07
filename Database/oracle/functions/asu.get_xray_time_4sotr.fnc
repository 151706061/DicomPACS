DROP FUNCTION ASU.GET_XRAY_TIME_4SOTR
/

--
-- GET_XRAY_TIME_4SOTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TIB (Table)
--   TSMID (Table)
--   GET_LABVIP (Function)
--   GET_VIPNAZ (Function)
--   GET_XRAY_VRACH (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_XRAY_TIME_4SOTR" (PFK_SOTRID IN NUMBER, PFK_SPRAVID IN NUMBER, PDATE1 IN DATE, PDATE2 IN DATE)
  RETURN NUMBER IS
CURSOR cSumVrach IS SELECT SUM((SELECT MAX(FN_NUM) FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2)) AS SUMTIME 
                      FROM ASU.TNAZIS 
                     WHERE TNAZIS.FK_ISPOLID = PFK_SOTRID
                       AND TNAZIS.FK_NAZSOSID = ASU.GET_VIPNAZ 
                       AND FD_RUN >= PDATE1 
                       AND FD_RUN <= PDATE2;
CURSOR cSumLaborant IS SELECT SUM((SELECT MAX(FN_NUM) FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -2 AND FK_SMEDITID = -2)) AS SUMTIME 
                         FROM TNAZIS, TIB 
                        WHERE TNAZIS.FK_ID = TIB.FK_PACID
                          AND TIB.FK_SMID = (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'RG_LABORANT') 
                          AND TIB.FN_NUM = PFK_SOTRID
                          AND TNAZIS.FK_NAZSOSID IN (ASU.GET_LABVIP, ASU.GET_VIPNAZ) 
                          AND FD_RUN >= PDATE1 
                          AND FD_RUN <= PDATE2;    

nRes NUMBER; 

BEGIN 
  IF PFK_SPRAVID = ASU.GET_XRAY_VRACH THEN
    OPEN cSumVrach;
    FETCH cSumVrach INTO nRes;
    CLOSE cSumVrach;
  ELSE
    OPEN cSumLaborant;
    FETCH cSumLaborant INTO nRes;
    CLOSE cSumLaborant;
  END IF;       
    RETURN nRes; 
END;
/

SHOW ERRORS;


