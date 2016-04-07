DROP FUNCTION ASU.GET_PATNAME
/

--
-- GET_PATNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPATNAME (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PATNAME" 
  (pFK_ID IN NUMBER )
  RETURN   VARCHAR2 IS
--
-- Purpose:
--
-- MODIFICATION HISTORY
-- Person      		Date    Comments
-- ---------   		------  -------------------------------------------
-- Philip A. Milovanov
CURSOR C IS SELECT /*+RULE*/ FC_NAME FROM TPATNAME WHERE FK_ID=pFK_ID;
I VARCHAR2(1000);
BEGIN
  OPEN C;
  FETCH C INTO I;
  CLOSE C;
  RETURN I;
END;
/

SHOW ERRORS;


