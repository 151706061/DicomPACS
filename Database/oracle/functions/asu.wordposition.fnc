DROP FUNCTION ASU.WORDPOSITION
/

--
-- WORDPOSITION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."WORDPOSITION" (N IN INTEGER, S IN VARCHAR2, WordDelims IN VARCHAR2)
  RETURN INTEGER
IS
  nCount   INTEGER;
  I        INTEGER;
  Result   INTEGER;
BEGIN
  nCount := 0;
  I := 1;
  Result := 0;
  WHILE (I <= LENGTH (S))
    AND (nCount <> N)
  LOOP
    WHILE (I <= LENGTH (S))
      AND (SUBSTR (s, i, 1) = WordDelims)
    LOOP
      i := i + 1;
    END LOOP;
--    { if we're not beyond end of S, we're at the start of a word }
    IF I <= LENGTH (S) THEN
      nCount := nCount + 1;
    END IF;
--    { if not finished, find the end of the current word }
    IF nCount <> N THEN
      WHILE (I <= LENGTH (S))
        AND NOT (SUBSTR (s, i, 1) = WordDelims)
      LOOP
        i := i + 1;
      END LOOP;
    ELSE
      Result := I;
    END IF;
  END LOOP;
  RETURN Result;
END;
/

SHOW ERRORS;


