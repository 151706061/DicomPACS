DROP FUNCTION ASU.GET_ED_IZM
/

--
-- GET_ED_IZM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ED_IZM" 
  (pFK_ID IN NUMBER )
  RETURN VARCHAR2 IS
--
-- Purpose: Возразает единицу измрения из дерева
-- By Philip A. Milovanov
CURSOR c IS SELECT /*+rule*/FC_ED_IZM FROM TSMID WHERE FK_ID=pFK_ID;
str VARCHAR2(30);
BEGIN
  OPEN c;
  FETCH c INTO str;
  CLOSE c;
  RETURN str;
END; -- Function GET_ED_IZM
/

SHOW ERRORS;


