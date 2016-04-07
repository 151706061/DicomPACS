DROP FUNCTION ASU.GET_PACKORPID
/

--
-- GET_PACKORPID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   GET_PACPALATADATE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACKORPID" (pFK_ID IN NUMBER,pFD_DATE IN DATE) RETURN NUMBER -- Created by TimurLan
 IS-- used in rDirector;
  nTemp NUMBER;
  CURSOR cTemp IS
         SELECT fk_korpid
           FROM troom
          WHERE fk_id = (GET_PACPALATADATE(pFK_ID,pFD_DATE));
--          WHERE fk_id = (GET_PACPALATAID(pFK_ID));
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  RETURN nTemp;
END;
/

SHOW ERRORS;


