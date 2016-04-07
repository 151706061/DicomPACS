DROP FUNCTION ASU.DO_MAINDIAG_SMID
/

--
-- DO_MAINDIAG_SMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_MAINDIAG_SMID" (pacid IN NUMBER)
  RETURN VARCHAR2
IS
  CURSOR c1 (pacid IN NUMBER)
  IS
    SELECT
       fk_smdiagid
      FROM tdiag
     WHERE fk_pacid = pacid
       AND fl_main = 1
       AND fp_type = 2;

  diagid   NUMBER;
BEGIN
  FOR i IN c1(pacid) LOOP
    diagid  := i.fk_smdiagid;
  END LOOP;
  RETURN diagid;
END;
/

SHOW ERRORS;


