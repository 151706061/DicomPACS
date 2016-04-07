DROP FUNCTION ASU.IS_PATALOGY_EXISTS
/

--
-- IS_PATALOGY_EXISTS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPATALOGY (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PATALOGY_EXISTS" 
  ( pFK_ID IN NUMBER )
  RETURN  number IS
--
-- Purpose:
--
-- MODIFICATION HISTORY
-- Person      		Date    Comments
-- ---------   		------  -------------------------------------------
-- Philip A. Milovanov
CURSOR c is SELECT count(FK_ID) FROM TPATALOGY WHERE FK_RESID=pFK_ID;
i NUMBER;
BEGIN
  OPEN c;
  FETCH c into i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


