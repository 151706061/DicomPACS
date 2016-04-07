DROP FUNCTION ASU.GET_FL_TEK
/

--
-- GET_FL_TEK  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_FL_TEK" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
  CURsoR c IS SELECT /*+first_rows*/ fp_tek_COC from tkarta where fk_id=pFK_ID;
  i NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  if i in (1,2) then
    i:=0;
  else
    i:=1;
  end if;
  RETURN i;
END;
/

SHOW ERRORS;


