DROP PROCEDURE ASU.DO_ADDAUDITREP
/

--
-- DO_ADDAUDITREP  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADDAUDITREP" (fk_vrachid NUMBER, fk_pacid NUMBER, fk_razdelid NUMBER, fc_comment VARCHAR2)
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  /*IF USERENV ('TERMINAL') NOT IN ('LDCSERVER', 'MIKITA') THEN
    INSERT INTO tauditrep
                (fk_vrachid, fk_pacid, fk_razdelid, fc_comment, fc_terminal)
         VALUES (fk_vrachid, fk_pacid, fk_razdelid, fc_comment, USERENV ('TERMINAL'));

    COMMIT;
  END IF; by TimurLan*/
  null;
END;
/

SHOW ERRORS;


