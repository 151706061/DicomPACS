DROP FUNCTION ASU.GET_PAC_DAYS
/

--
-- GET_PAC_DAYS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   PKG_REGIST_PACFUNC (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_DAYS" (pFK_PACID IN NUMBER)
RETURN NUMBER IS

RESULT BINARY_INTEGER;


CURSOR cDays IS SELECT SUM(FN_DAYS)
                  FROM (SELECT FK_ID,TRUNC(SYSDATE)-TRUNC(FD_DATA1) FN_DAYS
                          FROM TSROKY
                         WHERE FK_PACID=pFK_PACID
                           AND FK_PRYB = 2 --not in (1,3,7)
                          -- AND FD_DATA3<=FD_DATA2
                           AND FD_DATA3>FD_DATA1); -- исправлено by Timurlan 27.06.2005
                       /*  UNION
                        SELECT FK_ID,TRUNC(SYSDATE)-TRUNC(FD_DATA1) FN_DAYS
                          FROM TSROKY
                         WHERE FK_PACID=pFK_PACID
                           AND FK_PRYB not in (1,3,7)
                           AND FD_DATA3>FD_DATA2);*/

BEGIN 
  OPEN cDays;
  FETCH cDays INTO RESULT;
  CLOSE cDays;

  IF RESULT = 0 THEN
    RETURN 1;
  ELSE
    --RETURN RESULT;
    return(NVL(Result,pkg_regist_pacfunc.GET_PAC_PUTDAYS(pFK_PACID)));
  END IF;
END;
/

SHOW ERRORS;


