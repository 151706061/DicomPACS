DROP TRIGGER ASU.TRESMEDCONT$SALDO
/

--
-- TRESMEDCONT$SALDO  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TRESMED (Table)
--   TRESMEDCONT (Table)
--   TRESMEDSALDO (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMEDCONT$SALDO" 
AFTER INSERT OR UPDATE OF FK_MEDKARTID,FN_KOL OR DELETE
ON ASU.TRESMEDCONT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR cResMed (pFK_RESMEDID IN NUMBER)
  IS
    SELECT *
      FROM tresmed
     WHERE fk_id = pFK_RESMEDID;
  nDelta   NUMBER := 0;
BEGIN
  IF :new.fk_medkartid = -1 THEN
    RETURN;
  END IF;
  FOR i IN cResMed (:old.fk_resmedid) LOOP
    IF     (   inserting
            OR updating)
       AND :new.fk_medkartid <> -1 THEN
      BEGIN
        INSERT INTO tresmedsaldo
                    (fn_kol, fk_medkartid, fk_postavshikid, fd_date)
             VALUES (:new.fn_kol, :new.fk_medkartid, i.fk_apostavshikid, i.fd_data);
      EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
          NULL;
      END;
    END IF;
    IF inserting THEN
      nDelta  := :new.fn_kol;
    ELSIF deleting THEN
      nDelta  := -:old.fn_kol;
    ELSIF updating THEN
      nDelta  := :new.fn_kol - :old.fn_kol;
    END IF;
    UPDATE tresmedsaldo
       SET fn_kol = fn_kol + nDelta
     WHERE fk_postavshikid = i.fk_apostavshikid
       AND fk_medkartid = :new.fk_medkartid
       AND fd_date >= i.fd_data;
  END LOOP;
END;
/
SHOW ERRORS;


