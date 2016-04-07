DROP PROCEDURE ASU.DO_INSERT_PAC_TO_GRAPH
/

--
-- DO_INSERT_PAC_TO_GRAPH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPACLST (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_PAC_TO_GRAPH" (pfk_graphid IN NUMBER, pfk_pacid IN NUMBER)
IS
-- Mikrom      04.01.2001    Create
   PRAGMA AUTONOMOUS_TRANSACTION;
   pac   NUMBER := 0.0;

   CURSOR c1 (pgraph NUMBER)
   IS
      SELECT fk_pacid
        FROM tpaclst
       WHERE fk_graphid = pgraph;
BEGIN
   OPEN c1 (pfk_graphid);

   LOOP
      FETCH c1
       INTO pac;

      IF c1%NOTFOUND
      THEN
         EXIT;
      END IF;

      IF pac = pfk_pacid
      THEN
         RETURN;
      END IF;
   END LOOP;

   CLOSE c1;

   INSERT INTO tpaclst
               (fk_graphid, fk_pacid
               )
        VALUES (pfk_graphid, pfk_pacid
               );

   COMMIT;
END;
/

SHOW ERRORS;


