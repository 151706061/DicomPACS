DROP PROCEDURE ASU.DO_INS_UPDT_TPAC_INSURANCE
/

--
-- DO_INS_UPDT_TPAC_INSURANCE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPAC_INSURANCE (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INS_UPDT_TPAC_INSURANCE"
   (pFK_PACID         IN NUMBER,
    pFK_INSURDOCID    IN NUMBER)
   IS

   n NUMBER;
BEGIN
        SELECT MAX(i.fk_id)
        INTO n
        FROM asu.tpac_insurance i
        WHERE i.fk_pacid = pFK_PACID;

        IF n IS NULL
        THEN
           INSERT INTO asu.tpac_insurance(FK_PACID, FK_INSURDOCID)
           VALUES(pFK_PACID, pFK_INSURDOCID);

        ELSE
           UPDATE asu.tpac_insurance
           SET fk_insurdocid = pFK_INSURDOCID
           WHERE fk_pacid = pFK_PACID;
        END IF;
END "DO_INS_UPDT_TPAC_INSURANCE"; -- Procedure
/

SHOW ERRORS;


