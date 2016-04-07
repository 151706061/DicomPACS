DROP FUNCTION ASU.GET_KABNAME
/

--
-- GET_KABNAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKABINET (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KABNAME" (fk_kabid IN NUMBER)
   RETURN VARCHAR2
IS
   CURSOR c1
   IS
      SELECT fc_name
        FROM tkabinet
       WHERE fk_id = fk_kabid;

   kab   VARCHAR2 (100) := '';
BEGIN
   OPEN c1;

   FETCH c1
    INTO kab;

   IF c1%NOTFOUND
   THEN
      RETURN 'Не назначено';
   ELSE
      RETURN kab;
   END IF;
END;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_KABNAME
/

--
-- GET_KABNAME  (Synonym) 
--
--  Dependencies: 
--   GET_KABNAME (Function)
--
CREATE SYNONYM BUH.GET_KABNAME FOR ASU.GET_KABNAME
/


