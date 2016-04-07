DROP FUNCTION ASU.IS_HAS_CHILDS
/

--
-- IS_HAS_CHILDS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_HAS_CHILDS" 
  ( pFK_SMID IN NUMBER)
  RETURN  NUMBER IS
CURSOR c IS select fl_showanal from tsmid where fk_owner=pFK_SMID and fl_showanal=3;
i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  IF c%NOTFOUND THEN
    i:=0;
  ELSE
    i:=1;
  END IF;
  CLOSE c;
  RETURN i;
END; -- Function IS_HAS_CHILDS
/

SHOW ERRORS;


