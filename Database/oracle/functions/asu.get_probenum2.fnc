DROP FUNCTION ASU.GET_PROBENUM2
/

--
-- GET_PROBENUM2  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABREG (Table)
--   PKG_SMINI (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_PROBENUM2" (pFK_PACID IN NUMBER)
  RETURN NUMBER
IS

  CURSOR c
  IS
    SELECT
        MAX(FN_PROBE)
    FROM
        TLABREG
    WHERE
        fk_pacid = pFK_PACID
        AND trunc(FD_REGIST) > trunc(TO_DATE(PKG_SMINI.READSTRING('LAB','PROBEFIRSTDATE',SYSDATE),'dd.mm.yyyy'));

  CURSOR c1
  IS
    SELECT
        MAX(FN_PROBE)
    FROM
        TLABREG
    WHERE
        trunc(FD_REGIST) > trunc(TO_DATE(PKG_SMINI.READSTRING('LAB','PROBEFIRSTDATE',SYSDATE),'dd.mm.yyyy'));

  n   NUMBER;

BEGIN

  OPEN C;
  FETCH c INTO n;
  IF n IS NULL THEN
    OPEN C1;
    FETCH C1 INTO n;
    n  := n + 1;
    CLOSE C1;
    IF n IS NULL THEN
        n := 3;
    END IF;
  END IF;
  CLOSE C;
  RETURN n;

END;
/

SHOW ERRORS;


