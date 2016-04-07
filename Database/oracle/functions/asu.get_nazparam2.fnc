DROP FUNCTION ASU.GET_NAZPARAM2
/

--
-- GET_NAZPARAM2  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZPARAM2" (pfk_id IN NUMBER)
   RETURN VARCHAR2
IS
   str     VARCHAR2 (256) := '';
   tmp     VARCHAR2 (256) := '';
   csmid   VARCHAR2 (256) := '';

   CURSOR c1 (pid NUMBER)
   IS
      SELECT   
               tib.fc_char fc_char, tsmid.fc_name fc_name
          FROM tib, tsmid
         WHERE fk_pacid = pid AND tsmid.fk_id = tib.fk_smid
      ORDER BY tib.fk_id;
BEGIN
   OPEN c1 (pfk_id);

   LOOP
      FETCH c1
       INTO tmp, csmid;

      EXIT WHEN c1%NOTFOUND;

      IF NOT (tmp IS NULL)
      THEN
         str := str || ' ' || tmp;
      END IF;

      IF tmp IS NULL
      THEN
         str := str || ' ' || csmid;
      END IF;
   END LOOP;

   CLOSE c1;

   RETURN str;
END;
/

SHOW ERRORS;


