DROP FUNCTION ASU.GET_STRAGE
/

--
-- GET_STRAGE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_STRAGE" (n IN NUMBER)
  RETURN VARCHAR2
IS
-- Purpose: ¬озвращает строку с возрастом
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
--Sam создание 21-03-2001
  s        VARCHAR2 (100);
  nMonth   INTEGER;
  nTmp number;
-- Declare program variables as shown above
BEGIN
  nTmp:=trunc(n);
  IF nTmp < 5 THEN
    IF n = 1 THEN
      s  := '1 год ';
    ELSE
      s  := TRUNC (n) || ' года ';
    END IF;
    nMonth  := TRUNC (12 * (n - TRUNC (n)));
    IF nMonth = 1 THEN
      RETURN s || ' 1 мес€ц';
    END IF;
    IF nMonth IN (2, 3, 4) THEN
      RETURN s || nMonth || ' мес€ца';
    END IF;
    RETURN s || nMonth || ' мес€цев';
  ELSE
    IF nTmp IN (21, 31, 41, 51, 61, 71, 81, 91, 101, 121, 131, 141, 151, 161) THEN
      RETURN trunc(n) || ' год';
    END IF;
    IF nTmp IN (22, 23, 24, 32, 33, 34, 42, 43, 44, 52, 53, 54, 62, 63, 64, 72, 73, 74, 82, 83, 84, 92, 93, 94, 102, 103, 104) THEN
      RETURN trunc(n) || ' года';
    ELSE
      RETURN trunc(n) || ' лет';
    END IF;
  END IF;
END;                                                                                                                                                          -- Function GET_STRAGE
/

SHOW ERRORS;


