DROP FUNCTION ASU.GET_WORD
/

--
-- GET_WORD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_WORD" (s IN VARCHAR2, N IN INTEGER, razd IN CHAR DEFAULT ' ')
  RETURN VARCHAR2
IS
--
--  getting word number N from S derived with Razd
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- Sam        17.10.99
-- ---------   ------  -------------------------------------------
-- Declare program variables as shown above
  i      INTEGER;
  wc     INTEGER;
  lens   INTEGER;
  st     VARCHAR2(32767);
BEGIN
  st := s || Razd;
  IF (N = 0) THEN
    st := SUBSTR (st, 1, INSTR (st, Razd, 1, 1) - 1);
    RETURN st;
  END IF;
  st := SUBSTR (s, INSTR (s, Razd, 1, n) + 1, INSTR (s, Razd, 1, n + 1) - INSTR (s, Razd, 1, n) - 1);
  IF st IS NULL THEN
    st := SUBSTR (s, INSTR (s, Razd, 1, n) + 1);
  END IF;
  RETURN st;
END;
/

SHOW ERRORS;


