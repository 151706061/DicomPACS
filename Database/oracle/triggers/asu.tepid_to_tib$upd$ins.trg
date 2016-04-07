DROP TRIGGER ASU.TEPID_TO_TIB$UPD$INS
/

--
-- TEPID_TO_TIB$UPD$INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TTRANSPORT (Table)
--   GET_SYNID (Function)
--   TEPID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEPID_TO_TIB$UPD$INS" 
AFTER INSERT OR UPDATE
ON ASU.TEPID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   CURSOR ctransport IS
      SELECT fc_name
        FROM ttransport
       WHERE fk_id = :new.fp_tran;
BEGIN
--вставка в историю болезни данных эпиданамнеза
   FOR transport IN ctransport LOOP
      DELETE FROM tib
        WHERE fk_pacid = :old.fk_id
          AND fk_smeditid = get_synid ('EPID_TRANSPORT');
      INSERT INTO tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
           VALUES (:new.fk_pacid, transport.fc_name, get_synid ('EPID_TRANSPORT'), get_synid ('EPID_TRANSPORT'));
   END LOOP;
END;
/
SHOW ERRORS;


