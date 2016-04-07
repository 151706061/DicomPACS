DROP FUNCTION ASU.GET_NAZDONE
/

--
-- GET_NAZDONE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   VRES (Table)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZDONE" (pfk_id IN NUMBER)
   RETURN NUMBER
IS
   kolvo   NUMBER := 0.0;
   pacid   NUMBER := 0.0;
   smid    NUMBER := 0.0;
BEGIN
   SELECT fk_pacid, fk_smid
     INTO pacid, smid
     FROM vnaz
    WHERE fk_id = pfk_id;

   SELECT COUNT (fk_id)
     INTO kolvo
     FROM vres
    WHERE fk_smid = smid AND fk_pacid = pacid AND fk_nazid = pfk_id
          AND fk_sos = get_vipnaz;

   RETURN kolvo;
END;
/

SHOW ERRORS;


