DROP FUNCTION ASU.IS_HAS_THIS_CHILD
/

--
-- IS_HAS_THIS_CHILD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_HAS_THIS_CHILD" (pFK_STARTID IN NUMBER, pfk_smid IN NUMBER)
   RETURN NUMBER IS
-- Purpose: Имеет ли этот нод ребенка с переданным кодом
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- SAM          26.08.2000

   CURSOR c IS
      SELECT fk_id
        FROM tsmid
       WHERE fk_id = pfk_smid
       START WITH fk_id = pfk_startid
      CONNECT BY PRIOR fk_id = fk_owner;

   nres   NUMBER := 0;
BEGIN
   FOR i IN c LOOP
      nres := 1;
   END LOOP;
   RETURN nres;
END;
/

SHOW ERRORS;


