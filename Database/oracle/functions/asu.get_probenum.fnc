DROP FUNCTION ASU.GET_PROBENUM
/

--
-- GET_PROBENUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLABREG (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PROBENUM" (pFK_PACID IN NUMBER)
  RETURN NUMBER
IS

  CURSOR c
  IS
    SELECT
        MAX(FN_PROBE)
    FROM
        TLABREG
    WHERE
        fk_pacid = pFK_PACID;

  CURSOR c1
  IS
    SELECT
        FN_PROBE
    FROM
        TLABREG
    ORDER BY
        fd_regist desc;

  n   NUMBER;

BEGIN

  OPEN C;
  FETCH c INTO n;
  IF C%NOTFOUND THEN
    OPEN C1;
    FETCH C1 INTO n;
    n  := n + 1;
    CLOSE C1;
    IF n IS NULL THEN
        n := 1;
    END IF;
  END IF;
  CLOSE C;
  RETURN n;
END;
/

SHOW ERRORS;


