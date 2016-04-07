DROP FUNCTION ASU.DO_DIAGBYTYPEDATE
/

--
-- DO_DIAGBYTYPEDATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_DIAGBYTYPEDATE" (pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1)
  RETURN DATE
IS
  CURSOR c1 (pacid IN NUMBER, ptype IN NUMBER, bMain IN NUMBER, pNazID IN NUMBER DEFAULT -1)
  IS
    SELECT MIN (fd_date) AS fd_date
      FROM tdiag
     WHERE fk_pacid = pacid
       AND fl_main = bMain
       AND fp_type = ptype
       AND FK_NAZID = pNazID;

  res      DATE;
  diagid   NUMBER;
BEGIN
  FOR i IN c1 (pacid, ptype, bMain, pNazID) LOOP
    res  := i.fd_date;
  END LOOP;
  RETURN res;
END DO_DIAGBYTYPEDATE;
/

SHOW ERRORS;


