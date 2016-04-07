DROP FUNCTION ASU.GET_PATALOGY_LEVEL
/

--
-- GET_PATALOGY_LEVEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPATNAME (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PATALOGY_LEVEL" 
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
--
-- Purpose:
--
-- MODIFICATION HISTORY
-- Person      		Date    Comments
-- ---------   		------  -------------------------------------------
-- Philip A. Milovanov
CURSOR C IS SELECT FP_PRIOR FROM TPATNAME WHERE FK_ID=pFK_ID;
i NUMBER;
BEGIN
  OPEN C;
  FETCH C INTO i;
  CLOSE C;
  IF i IS NULL THEN
    RETURN 0;
  END IF;
  RETURN i;
END;
/

SHOW ERRORS;


