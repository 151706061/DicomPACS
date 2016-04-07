DROP FUNCTION ASU.GET_LAB_OTD
/

--
-- GET_LAB_OTD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_OTD" (ID IN NUMBER)
   RETURN NUMBER DETERMINISTIC
IS
   CURSOR c1
   IS
      SELECT     fk_id
            FROM tsmid
           WHERE fk_id <> get_synid ('RAZ_ANAL')
      START WITH fk_id = ID
      CONNECT BY PRIOR fk_owner = fk_id
        ORDER BY ROWNUM DESC;

   res   NUMBER;
BEGIN
   OPEN c1;

   FETCH c1
    INTO res;

   RETURN res;

   CLOSE c1;
END;
/

SHOW ERRORS;


