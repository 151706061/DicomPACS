DROP FUNCTION ASU.GET_PACKUR
/

--
-- GET_PACKUR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANAMNEZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACKUR" (pfk_id IN NUMBER)
   RETURN NUMBER
IS
   CURSOR ctemp
   IS
      SELECT fp_kur
        FROM tanamnez
       WHERE fk_pacid = pfk_id;

   ntemp   NUMBER;
BEGIN
   OPEN ctemp;

   FETCH ctemp
    INTO ntemp;

   CLOSE ctemp;

   RETURN ntemp;
END;
/

SHOW ERRORS;


