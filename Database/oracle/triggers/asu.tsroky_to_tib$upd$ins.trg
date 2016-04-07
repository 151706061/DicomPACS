DROP TRIGGER ASU.TSROKY_TO_TIB$UPD$INS
/

--
-- TSROKY_TO_TIB$UPD$INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSROKY (Table)
--   TIB (Table)
--   GET_SYNID (Function)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_TO_TIB$UPD$INS" 
AFTER  INSERT  OR UPDATE  ON ASU.TSROKY REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
DISABLE
BEGIN
--вставка в историю болезни данных эпиданамнеза
   IF :new.fk_pryb = 2 THEN
      DELETE FROM tib
       WHERE fk_pacid = :old.fk_id
         AND fk_smeditid = get_synid ('EPID_PRYB_DATA');
      INSERT INTO tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
          VALUES (:new.fk_pacid, TO_CHAR (:new.fd_data1, 'dd.mm.yyyy'), get_synid ('EPID_PRYB_DATA'), get_synid ('EPID_PRYB_DATA'));
   END IF;
END;
/
SHOW ERRORS;


