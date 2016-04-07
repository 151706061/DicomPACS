DROP FUNCTION ASU.GET_PACOPOZD
/

--
-- GET_PACOPOZD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACOPOZD" (pfk_id IN NUMBER)
   RETURN NUMBER
IS
   dtemp1   DATE;
   dtemp2   DATE;

   CURSOR ctemp1
   IS
      SELECT fd_data1
        FROM tsroky
       WHERE fk_pacid = pfk_id AND fk_pryb = 1;

   CURSOR ctemp2
   IS
      SELECT fd_data1
        FROM tsroky
       WHERE fk_pacid = pfk_id AND fk_pryb = 2;
BEGIN
   OPEN ctemp1;

   FETCH ctemp1
    INTO dtemp1;

   CLOSE ctemp1;

   OPEN ctemp2;

   FETCH ctemp2
    INTO dtemp2;

   CLOSE ctemp2;

   RETURN TRUNC (dtemp2 - dtemp1);
END;
/

SHOW ERRORS;


