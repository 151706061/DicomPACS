DROP PACKAGE BODY ASU.PKG_VRES
/

--
-- PKG_VRES  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_VRES" 
IS

-- Andrew      11.04.2002
   FUNCTION get_nazproc_count (pnazid NUMBER, psmid NUMBER)
      RETURN NUMBER
   IS
      tmp   NUMBER := 0.0;
      CURSOR c1 (pnazid NUMBER, psmid NUMBER)
      IS
         SELECT fn_value
           FROM tnazparam
          WHERE fk_nazid = pnazid
            AND fk_paramid = (SELECT fk_id
                                FROM tlechparam
                               WHERE fk_smid = psmid AND fc_type =
                                                                  'PROCCOUNT');
   BEGIN
      OPEN c1 (pnazid, psmid);
      FETCH c1 INTO tmp;
      CLOSE c1;
      IF tmp = 0
      THEN
         tmp := 1;
      END IF;
      RETURN tmp;
   END;
   PROCEDURE Write_proccount (pnazid NUMBER, psmid NUMBER, pCount number)
   IS
      tmp   NUMBER := 0;
      CURSOR c1 (pnazid NUMBER, psmid NUMBER)
      IS
         SELECT fk_id
           FROM tnazparam
          WHERE fk_nazid = pnazid
            AND fk_paramid = (SELECT fk_id
                                FROM tlechparam
                               WHERE fk_smid = psmid AND fc_type =
                                                                  'PROCCOUNT');
   BEGIN
      OPEN c1 (pnazid, psmid);
      FETCH c1 INTO tmp;
      CLOSE c1;
      update tnazparam set FN_VALUE = pCount where fk_id=tmp;
   END;

   FUNCTION get_nazproc_mask (pnazid IN NUMBER, psmid IN NUMBER)
      RETURN VARCHAR2
   IS
      tmp   VARCHAR2 (100) := '';
      CURSOR c1 (pnazid NUMBER, psmid NUMBER)
      IS
         SELECT fc_default
           FROM tlechparam
          WHERE fk_smid = psmid
            AND NOT fc_default IS NULL
            AND fk_id IN (SELECT fk_valueid
                            FROM tnazparam
                           WHERE fk_nazid = pnazid AND NOT fk_valueid IS NULL);
   BEGIN
      OPEN c1 (pnazid, psmid);
      FETCH c1 INTO tmp;
      IF c1%NOTFOUND
      THEN
         CLOSE c1;
         RETURN '1';
      END IF;
      CLOSE c1;
      RETURN tmp;
   END;
   PROCEDURE insert_someproc (
      psmid     IN   NUMBER,
      ppacid    IN   NUMBER,
      pnazid    IN   NUMBER,
--      psosid    IN   NUMBER,
      pdayins   IN   DATE
   )
   IS
      pcount      NUMBER         := 0.0;
      pmask       VARCHAR2 (100) := '';
      i           NUMBER         := 1;
      pdate       DATE;
      pdaynum     NUMBER         := 0.0;
      pmask_pos   NUMBER         := 1;
      psun        NUMBER         := 0.0;
      pis_ins     BOOLEAN;
      nispol_id   NUMBER         := 0.0;
      CURSOR proc_count (pnazid NUMBER, psmid NUMBER)
      IS
         SELECT get_nazproc_count (pnazid, psmid)
           FROM DUAL;
      CURSOR proc_mask (pnazid NUMBER, psmid NUMBER)
      IS
         SELECT get_nazproc_mask (pnazid, psmid)
           FROM DUAL;
      CURSOR number_day_of_week (pval DATE)
      IS
         SELECT TO_CHAR (pdate, 'fmD')
           FROM DUAL;
      CURSOR sunday_num
      IS
         SELECT get_num_of_sunday
           FROM DUAL;
      CURSOR naz_ispol (pid NUMBER)
      IS
         SELECT /*+rule*/
                fk_ispolid
           FROM tnazlech
          WHERE fk_id = pid;
   BEGIN
      OPEN naz_ispol (pnazid);
      FETCH naz_ispol INTO nispol_id;
      CLOSE naz_ispol;
      OPEN proc_count (pnazid, psmid);
      FETCH proc_count INTO pcount;
      CLOSE proc_count;
      IF    pcount = 0
         OR pcount <= 1
      THEN
         RETURN;
      END IF;
      OPEN proc_mask (pnazid, psmid);
      FETCH proc_mask INTO pmask;
      CLOSE proc_mask;
      OPEN sunday_num;
      FETCH sunday_num INTO psun;
      CLOSE sunday_num;
      pmask := TRIM (pmask);
      IF    pmask = ''
         OR LENGTH (pmask) < 1
         OR (LENGTH (pmask) = 1 AND SUBSTR (pmask, 1, 1) = '1')
      THEN
         LOOP
            EXIT WHEN i > pcount;
            LOOP
               pdate :=   pdayins
                        + i
                        - 1;
               OPEN number_day_of_week (pdate);
               FETCH number_day_of_week INTO pdaynum;
               CLOSE number_day_of_week;
               IF  pdaynum <> psun AND pdaynum > 0
               THEN
                  EXIT;
               ELSE
                  i :=   i
                       + 1;
                  pcount :=   pcount
                            + 1;
               END IF;
            END LOOP;
            INSERT INTO VRES
                        (fk_smid, fd_ins, fk_pacid, fk_nazid, fk_sos,
                         fk_vrachid)
                 VALUES (psmid, pdate, ppacid, pnazid, get_nevip,
                 --psosid,
                         nispol_id);
            i :=   i
                 + 1;
         END LOOP;
      ELSIF  pmask <> '0' AND LENGTH (pmask) > 1
      THEN
         i := 1;
         pmask_pos := 1;
         LOOP
            EXIT WHEN i > pcount;
            LOOP
               pdate :=   pdayins
                        + i
                        - 1;
               OPEN number_day_of_week (pdate);
               FETCH number_day_of_week INTO pdaynum;
               CLOSE number_day_of_week;
               IF  pdaynum <> psun AND pdaynum > 0
               THEN
                  pis_ins := TRUE;
                  EXIT;
               ELSE
                  i :=   i
                       + 1;
                  pcount :=   pcount
                            + 1;
                  pis_ins := FALSE;
               END IF;
            END LOOP;
            IF  SUBSTR (pmask, pmask_pos, 1) <> '0' AND pis_ins = TRUE
            THEN
               INSERT INTO VRES
                           (fk_smid, fd_ins, fk_pacid, fk_nazid, fk_sos,
                            fk_vrachid)
                    VALUES (psmid, pdate, ppacid, pnazid, get_nevip,
                    -- psosid,
                            nispol_id);
               i :=   i
                    + 1;
               pmask_pos :=   pmask_pos
                            + 1;
            ELSIF pis_ins = TRUE
            THEN
               i :=   i
                    + 1;
               pcount :=   pcount
                         + 1;
               pmask_pos :=   pmask_pos
                            + 1;
            END IF;
            IF pmask_pos > LENGTH (pmask)
            THEN
               pmask_pos := 1;
            END IF;
         END LOOP;
      ELSE
         RETURN;
      END IF;
   END;

   FUNCTION get_num_of_sunday
      RETURN NUMBER
   IS
      tmp   NUMBER := 0.0;
      CURSOR num_of_day
      IS
         SELECT TO_CHAR (TO_DATE ('04.03.2001', 'DD.MM.YYYY'), 'fmD')
           FROM dual;
   BEGIN
      OPEN num_of_day;
      FETCH num_of_day INTO tmp;
      CLOSE num_of_day;
      RETURN tmp;
   END;
END;
/

SHOW ERRORS;


