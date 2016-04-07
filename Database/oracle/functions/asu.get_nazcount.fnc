DROP FUNCTION ASU.GET_NAZCOUNT
/

--
-- GET_NAZCOUNT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPACLST (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZCOUNT" (nfk_id IN NUMBER)
   RETURN NUMBER
IS
-- Purpose: Возвращает кол-во назначеных человек на назначение в это время
-- MODIFICATION HISTORY
-- Mikrom      8.06.2000  Create
-- ---------   ---------  -------------------------------------------
   CURSOR c (pid IN NUMBER)
   IS
      SELECT /*+ INDEX(tpaclst TPACLST_GRAPHID) */ COUNT (fk_graphid)
        FROM tpaclst
       WHERE fk_graphid = pid;

   ncount   NUMBER := 0.0;
BEGIN
   OPEN c (nfk_id);
   FETCH c INTO ncount;
   CLOSE c;
   RETURN ncount;
END;   -- Function GET_NAZCOUNT
/

SHOW ERRORS;


