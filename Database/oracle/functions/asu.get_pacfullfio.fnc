DROP FUNCTION ASU.GET_PACFULLFIO
/

--
-- GET_PACFULLFIO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACFULLFIO" (pfk_id IN NUMBER)
   RETURN VARCHAR2
IS
   CURSOR c
   IS
      SELECT tkarta.fc_fam || ' ' || tkarta.fc_im || ' ' || tkarta.fc_otch
        FROM tkarta
       WHERE fk_id = pfk_id;

   str   VARCHAR (90);
BEGIN
   OPEN c;

   FETCH c
    INTO str;

   CLOSE c;

   RETURN str;
END;
/

SHOW ERRORS;


