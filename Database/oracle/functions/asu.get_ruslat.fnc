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
    IF sTmp = 'é' THEN
      sTmp  := 'ij';
    ELSIF sTmp = 'ö' THEN
      sTmp  := 'ts';
    ELSIF sTmp = 'ó' THEN
      sTmp  := 'u';
    ELSIF sTmp = 'ê' THEN
      sTmp  := 'k';
    ELSIF sTmp = 'å' THEN
      sTmp  := 'e';
    ELSIF sTmp = 'ô' THEN
      sTmp  := 'f';
    ELSIF sTmp = 'û' THEN
      sTmp  := 'i';
    ELSIF sTmp = 'â' THEN
      sTmp  := 'v';
    ELSIF sTmp = 'à' THEN
      sTmp  := 'a';
    ELSIF sTmp = 'ï' THEN
      sTmp  := 'p';
    ELSIF sTmp = 'ÿ' THEN
      sTmp  := 'ja';
    ELSIF sTmp = '÷' THEN
      sTmp  := 'ch';
    ELSIF sTmp = 'ñ' THEN
      sTmp  := 's';
    ELSIF sTmp = 'ì' THEN
      sTmp  := 'm';
    ELSIF sTmp = 'è' THEN
      sTmp  := 'i';
    ELSIF sTmp = '¸' THEN
      sTmp  := 'jo';
    ELSIF sTmp = 'í' THEN
      sTmp  := 'n';
    ELSIF sTmp = 'ã' THEN
      sTmp  := 'g';
    ELSIF sTmp = 'ø' THEN
      sTmp  := 'sh';
    ELSIF sTmp = 'ù' THEN
      sTmp  := 'sh';
    ELSIF sTmp = 'ç' THEN
      sTmp  := 'z';
    ELSIF sTmp = 'õ' THEN
      sTmp  := 'h';
    ELSIF sTmp = 'ú' THEN
      sTmp  := '''';
    ELSIF sTmp = 'ð' THEN
      sTmp  := 'r';
    ELSIF sTmp = 'î' THEN
      sTmp  := 'o';
    ELSIF sTmp = 'ë' THEN
      sTmp  := 'l';
    ELSIF sTmp = 'ä' THEN
      sTmp  := 'd';
    ELSIF sTmp = 'æ' THEN
      sTmp  := 'g';
    ELSIF sTmp = 'ý' THEN
      sTmp  := 'e';
    ELSIF sTmp = 'ò' THEN
      sTmp  := 't';
    ELSIF sTmp = 'ü' THEN
      sTmp  := '''';
    ELSIF sTmp = 'á' THEN
      sTmp  := 'b';
    ELSIF sTmp = 'þ' THEN
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


