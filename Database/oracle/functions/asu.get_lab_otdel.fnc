DROP FUNCTION ASU.GET_LAB_OTDEL
/

--
-- GET_LAB_OTDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAB_OTDEL" (pfk_id IN NUMBER)
   RETURN NUMBER
IS
   CURSOR c1 (ID NUMBER)
   IS
      SELECT     fk_id
            FROM tsmid
           WHERE fk_id <> get_synid ('RAZ_ANAL') AND fl_showanal = 0
      START WITH fk_id = ID
      CONNECT BY PRIOR fk_owner = fk_id
        ORDER BY ROWNUM DESC;

   res   NUMBER;
BEGIN
   OPEN c1 (pfk_id);

   FETCH c1
    INTO res;

   RETURN res;

   CLOSE c1;
END;
/

SHOW ERRORS;


