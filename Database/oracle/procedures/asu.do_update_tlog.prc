DROP PROCEDURE ASU.DO_UPDATE_TLOG
/

--
-- DO_UPDATE_TLOG  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLOG (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_UPDATE_TLOG" IS
  nFK_ID NUMBER;
  c VARCHAR(30);
  c1 VARCHAR(30);
  CURSOR cc is SELECT FC_FIELD, FC_TABLE, FK_ID, FC_OLD, FC_NEW FROM asu.TLOG;
  CURSOR cc2(pFK_ID NUMBER) IS SELECT FK_PACID FROM TPERESEL WHERE FK_ID = pFK_ID;
BEGIN
    for c in cc   loop
        if c.FC_FIELD = 'FK_ID' THEN
            IF c.FC_OLD IS NOT NULL THEN
              nFK_ID := to_number(c.FC_OLD);
              c1 := c.FC_TABLE;
             ELSE
              nFK_ID := to_number(c.FC_NEW);
              c1 := c.FC_TABLE;
             end if;
             if c.FC_TABLE = 'TPERESEL' THEN
                OPEN cc2(nFK_ID);
                FETCH cc2 INTO nFK_ID;
                CLOSE cc2;
             END IF;
        END IF;
        if c1 = c.FC_TABLE then
            UPDATE TLOG SET FK_OWNER = nFK_ID WHERE FK_ID = c.FK_ID;
        END IF;
    end LOOP;

END; -- Procedure
/

SHOW ERRORS;


