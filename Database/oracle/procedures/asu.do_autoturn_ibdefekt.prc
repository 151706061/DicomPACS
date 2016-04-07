DROP PROCEDURE ASU.DO_AUTOTURN_IBDEFEKT
/

--
-- DO_AUTOTURN_IBDEFEKT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIBDEFEKT (Table)
--   TCLOBS (Table)
--   GET_PACPLANOUTCOME (Function)
--   GET_ZAVOTDID (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_AUTOTURN_IBDEFEKT" 
IS
  CURSOR cIbDefektNotExists
  IS
    SELECT tkarta.fk_id
      FROM tkarta
     WHERE fl_vyb = 1
       AND NOT EXISTS (SELECT fk_id
                         FROM tibdefekt
                        WHERE fk_pacid = tkarta.fk_id)
       AND SYSDATE - get_pacplanoutcome (fk_id) > 30
     ORDER BY get_pacplanoutcome (fk_id) DESC;

  nClobID   NUMBER (9, 0);
BEGIN
  FOR i IN cIbDefektNotExists LOOP
    IF get_zavotdid (i.fk_id) IS NOT NULL THEN
      INSERT INTO tclobs
                  (fk_id, fc_clob)
           VALUES (-1, EMPTY_CLOB ())
        RETURNING fk_id
        INTO nClobID;

      INSERT INTO tibdefekt
                  (FK_VRACHID, FK_CLOBID, FL_PODPIS, FK_PACID)
           VALUES (get_zavotdid (i.fk_id), nClobID, 1, i.fk_id);
    END IF;
  END LOOP;

  UPDATE tibdefekt
     SET fl_podpis = 1
   WHERE fk_pacid IN (SELECT tkarta.fk_id
                        FROM tkarta
                       WHERE fl_vyb = 1
                         AND SYSDATE - get_pacplanoutcome (fk_id) > 30);

  COMMIT;
END;
/

SHOW ERRORS;


