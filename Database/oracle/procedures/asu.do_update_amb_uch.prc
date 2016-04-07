DROP PROCEDURE ASU.DO_UPDATE_AMB_UCH
/

--
-- DO_UPDATE_AMB_UCH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TOTDEL_TYPEDOC (Table)
--   TADRESS (Table)
--   TAMBULANCE (Table)
--   TDOCOBSL (Table)
--   TTHERPOINTS (Table)
--   TTHERPOINTS_TERR (Table)
--   PKG_REGIST_PACFUNC (Package)
--   TSTREET (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_UPDATE_AMB_UCH" (potdel NUMBER, ptown NUMBER)
IS
   CURSOR c1 (potdel NUMBER)
   IS
      SELECT tamb.fk_id
        FROM tambulance tamb, tdocobsl, totdel_typedoc
       WHERE totdel_typedoc.fk_otdelid = potdel
         AND tdocobsl.fk_viddocid = totdel_typedoc.fk_typedoc
         AND tamb.fk_docobsl = tdocobsl.fk_id
         AND tamb.fk_uchid is null;

   CURSOR c2 (ppacid NUMBER, potdel NUMBER, ptown NUMBER)
   IS
      SELECT tt.fk_id
        FROM ttherpoints_terr ttr,
             ttherpoints_terr ttr2,
             ttherpoints tt,
             tadress ta,
             tstreet ts
       WHERE ttr.fk_owner = tt.fk_id
         AND tt.fk_otdel = potdel
         AND ta.fk_id = pkg_regist_pacfunc.get_pac_adrid (ppacid)
         AND ts.fk_id = ta.fk_streetid
         AND LTRIM (RTRIM (UPPER (ts.fc_name), 'УЛ.'), 'УЛ.') =
                             LTRIM (RTRIM (UPPER (ttr.fc_name), 'УЛ.'), 'УЛ.')
         AND ttr2.fk_owner = ttr.fk_id
         AND (   (    ttr2.fp_type = 2
                  AND DECODE (ta.fc_house,
                              REGEXP_REPLACE (ta.fc_house, '[[:alpha:]-/№\]'), ta.fc_house,
                              -1
                             ) = ttr2.fn_num1
                 )
              OR (    ttr2.fp_type = 3
                  AND DECODE (ta.fc_house,
                              REGEXP_REPLACE (ta.fc_house, '[[:alpha:]-/№\]'), ta.fc_house,
                              -1
                             ) BETWEEN ttr2.fn_num1 AND ttr2.fn_num2
                 )
             )
          AND ta.fk_townid=ptown;   
/*         AND EXISTS (
                SELECT fk_id
                  FROM tadress
                 WHERE fk_pacid = pkg_regist_pacfunc.get_pepl_id (ppacid)
                   AND fk_townid = ptown); */

   v_uchid     NUMBER;
   v_num       NUMBER := 0;
   v_num_upd   NUMBER := 0;
   v_id        NUMBER;
BEGIN
   FOR c11 IN c1 (potdel)
   LOOP
      v_id := c11.fk_id;
      v_num := v_num + 1;

      OPEN c2 (c11.fk_id, potdel, ptown);

      FETCH c2
       INTO v_uchid;

      IF c2%FOUND
      THEN
         v_num_upd := v_num_upd + 1;

         UPDATE tambulance
            SET fk_uchid = v_uchid
          WHERE fk_id = c11.fk_id;
      END IF;

      CLOSE c2;
   END LOOP;

   DBMS_OUTPUT.put_line (   'всего отработано'
                         || TO_CHAR (v_num)
                         || ' Определен участок для'
                         || TO_CHAR (v_num_upd)
                        );
EXCEPTION
   WHEN OTHERS
   THEN
      DBMS_OUTPUT.put_line (   'всего отработано'
                            || TO_CHAR (v_num)
                            || ' Определен участок для'
                            || TO_CHAR (v_num_upd)
                            || ' ID='
                            || TO_CHAR (v_id)
                           );
END;
/

SHOW ERRORS;


