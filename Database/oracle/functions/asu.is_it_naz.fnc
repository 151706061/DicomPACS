DROP FUNCTION ASU.IS_IT_NAZ
/

--
-- IS_IT_NAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   INC (Procedure)
--
CREATE OR REPLACE FUNCTION ASU."IS_IT_NAZ" (pFK_SMID IN NUMBER)
   RETURN NUMBER IS
-- можно ли назначить этот пункт из смид
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- SAM
   CURSOR c IS
      SELECT fk_id, fc_name
        FROM tsmid
       WHERE fl_showanal = 1
       START WITH fk_id = pFK_SMID
      CONNECT BY PRIOR fk_id = fk_owner;
   nTmp   NUMBER := 0;
BEGIN
   FOR i IN c LOOP
      inc(nTmp);
   END LOOP;
   IF nTmp = 1 THEN
      RETURN 1;
   ELSE
      RETURN 0;
   END IF;
END;                                                                                                                                                                                                                                      -- Function IS_IT_NAZ
/

SHOW ERRORS;


