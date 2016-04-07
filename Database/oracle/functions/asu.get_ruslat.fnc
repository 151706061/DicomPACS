DROP FUNCTION ASU.GET_RUSLAT
/

--
-- GET_RUSLAT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   GET_LOWER (Function)
--   GET_UPPER (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RUSLAT" (s IN VARCHAR2)
  RETURN VARCHAR2
IS
  res    VARCHAR2 (32767);
  sTmp   VARCHAR2 (2);
  i      INTEGER;
BEGIN
  i  := 1;
  IF s IS NULL THEN
    RETURN 'nullid';
  END IF;
  FOR i IN 1 .. LENGTH (s) LOOP
    sTmp  := get_lower (SUBSTR (s, i, 1));
    IF sTmp = '�' THEN
      sTmp  := 'ij';
    ELSIF sTmp = '�' THEN
      sTmp  := 'ts';
    ELSIF sTmp = '�' THEN
      sTmp  := 'u';
    ELSIF sTmp = '�' THEN
      sTmp  := 'k';
    ELSIF sTmp = '�' THEN
      sTmp  := 'e';
    ELSIF sTmp = '�' THEN
      sTmp  := 'f';
    ELSIF sTmp = '�' THEN
      sTmp  := 'i';
    ELSIF sTmp = '�' THEN
      sTmp  := 'v';
    ELSIF sTmp = '�' THEN
      sTmp  := 'a';
    ELSIF sTmp = '�' THEN
      sTmp  := 'p';
    ELSIF sTmp = '�' THEN
      sTmp  := 'ja';
    ELSIF sTmp = '�' THEN
      sTmp  := 'ch';
    ELSIF sTmp = '�' THEN
      sTmp  := 's';
    ELSIF sTmp = '�' THEN
      sTmp  := 'm';
    ELSIF sTmp = '�' THEN
      sTmp  := 'i';
    ELSIF sTmp = '�' THEN
      sTmp  := 'jo';
    ELSIF sTmp = '�' THEN
      sTmp  := 'n';
    ELSIF sTmp = '�' THEN
      sTmp  := 'g';
    ELSIF sTmp = '�' THEN
      sTmp  := 'sh';
    ELSIF sTmp = '�' THEN
      sTmp  := 'sh';
    ELSIF sTmp = '�' THEN
      sTmp  := 'z';
    ELSIF sTmp = '�' THEN
      sTmp  := 'h';
    ELSIF sTmp = '�' THEN
      sTmp  := '''';
    ELSIF sTmp = '�' THEN
      sTmp  := 'r';
    ELSIF sTmp = '�' THEN
      sTmp  := 'o';
    ELSIF sTmp = '�' THEN
      sTmp  := 'l';
    ELSIF sTmp = '�' THEN
      sTmp  := 'd';
    ELSIF sTmp = '�' THEN
      sTmp  := 'g';
    ELSIF sTmp = '�' THEN
      sTmp  := 'e';
    ELSIF sTmp = '�' THEN
      sTmp  := 't';
    ELSIF sTmp = '�' THEN
      sTmp  := '''';
    ELSIF sTmp = '�' THEN
      sTmp  := 'b';
    ELSIF sTmp = '�' THEN
      sTmp  := 'ju';
    END IF;
    IF get_lower (SUBSTR (s, i, 1)) = SUBSTR (s, i, 1) THEN
      res  := res || sTmp;
    ELSE
      res  := res || get_upper (sTmp);
    END IF;
  END LOOP;
  RETURN res;
END;                                                                                                                                                          -- Function GET_RUSLAT
-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/

SHOW ERRORS;


