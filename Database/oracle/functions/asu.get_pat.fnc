DROP FUNCTION ASU.GET_PAT
/

--
-- GET_PAT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   VRES (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAT" (pfk_id IN NUMBER)
   RETURN NUMBER
IS
   pacid   NUMBER := 0.0;
   smid    NUMBER := 0.0;
   patid   NUMBER := 0.0;
BEGIN
   SELECT fk_pacid, fk_smid
     INTO pacid, smid
     FROM vnaz
    WHERE fk_id = pfk_id;

   SELECT DISTINCT fk_patid
              INTO patid
              FROM vres
             WHERE fk_pacid = pacid
               AND fk_nazid = pfk_id
               AND fk_smid = smid
               AND fk_patid IS NOT NULL;

   RETURN patid;
END;
/

SHOW ERRORS;


