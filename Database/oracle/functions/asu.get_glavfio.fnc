DROP FUNCTION ASU.GET_GLAVFIO
/

--
-- GET_GLAVFIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPASS (Table)
--   DO_VRACHFIO (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_GLAVFIO" 
  RETURN VARCHAR2
IS
  res   VARCHAR2(210);

  CURSOR c1
  IS
    SELECT do_vrachfio (fk_sotrid)
      FROM tpass
     WHERE fk_specid = 913;
BEGIN
  OPEN c1;
  FETCH c1 INTO res;
  CLOSE c1;
  RETURN (initcap(res));
END;
/

SHOW ERRORS;


