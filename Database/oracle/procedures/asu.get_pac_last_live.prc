DROP PROCEDURE ASU.GET_PAC_LAST_LIVE
/

--
-- GET_PAC_LAST_LIVE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_PAC_LAST_LIVE" (pfk_id IN NUMBER, pfd_data1 OUT DATE, pfd_data2 OUT DATE)
IS
   CURSOR ctemp
   IS
      SELECT   fd_data1, fk_pryb
          FROM tsroky
         WHERE fk_pacid = pfk_id
      ORDER BY fk_id;

   CURSOR cdata2
   IS
      SELECT fd_data3
        FROM tsroky,
             (SELECT MAX (fk_id) fk_maxid
                FROM tsroky
               WHERE fk_pacid = pfk_id AND fk_pryb NOT IN (1, 3, 7))
       WHERE fk_id = fk_maxid;

   dtemp   DATE;
   ntemp   NUMBER;
BEGIN
   OPEN ctemp;

   LOOP
      FETCH ctemp
       INTO dtemp, ntemp;

      EXIT WHEN ctemp%NOTFOUND;

      IF ntemp = 2 OR ntemp = 4
      THEN
         pfd_data1 := dtemp;
--      Raise_Application_Error(-20002,TO_CHAR(dTemp));
      END IF;
   END LOOP;

   CLOSE ctemp;

   OPEN cdata2;

   FETCH cdata2
    INTO pfd_data2;

   CLOSE cdata2;
END;                                                                          -- Procedure
/

SHOW ERRORS;


