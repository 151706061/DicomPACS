DROP FUNCTION ASU.GET_SPECNAME
/

--
-- GET_SPECNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSPEC (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SPECNAME" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  CURSOR c1 is select fc_name from tspec where fk_id=pFK_ID;
  sTmp VARCHAR2(200);
BEGIN
  OPEN c1;
  FETCH c1 INTO sTmp;
  CLOSE c1;
  RETURN sTmp;
END;
/

SHOW ERRORS;


