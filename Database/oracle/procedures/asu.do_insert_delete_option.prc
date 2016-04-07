DROP PROCEDURE ASU.DO_INSERT_DELETE_OPTION
/

--
-- DO_INSERT_DELETE_OPTION  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVRACHKAB_NAZ (Table)
--   TSMID (Table)
--   GET_SYNID (Function)
--   DO_UPDATE_TVRACHKAB_NAZ (Procedure)
--   TNAZVRACH (View)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_DELETE_OPTION" 
IS
   v_delopt   NUMBER;
BEGIN
   SELECT NVL (get_synid ('IBRAZD_OPTION_DELETE'), -1)
     INTO v_delopt
     FROM DUAL;

   INSERT INTO tvrachkab_naz
               (fk_sotrkabid, fk_smid)
      SELECT t2.fk_sotrkabid, v_delopt
        FROM (SELECT   fk_sotrkabid
                  FROM tnazvrach tv,
                       (SELECT fk_id
                          FROM tsmid
                         WHERE UPPER (fc_name) LIKE '%›œ» –»«%'
                            OR UPPER (fc_name) LIKE
                                             '%¬€œ»— ¿ »« ¿Ã¡”À¿“Œ–ÕŒ…  ¿–“€%') t1
                 WHERE fk_smid = t1.fk_id
                   AND NOT EXISTS (
                          SELECT fk_id
                            FROM tvrachkab_naz
                           WHERE fk_sotrkabid = tv.fk_sotrkabid
                             AND fk_smid = v_delopt)
              GROUP BY fk_sotrkabid) t2;

   FOR i IN
      (SELECT   fk_sotrkabid
           FROM tnazvrach tv,
                (SELECT fk_id
                   FROM tsmid
                  WHERE UPPER (fc_name) LIKE '%›œ» –»«%'
                     OR UPPER (fc_name) LIKE '%¬€œ»— ¿ »« ¿Ã¡”À¿“Œ–ÕŒ…  ¿–“€%') t1
          WHERE fk_smid = t1.fk_id
       GROUP BY fk_sotrkabid)
   LOOP
      do_update_tvrachkab_naz (i.fk_sotrkabid);
   END LOOP;
END;
/

SHOW ERRORS;


