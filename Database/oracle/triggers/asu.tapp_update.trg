DROP TRIGGER ASU.TAPP_UPDATE
/

--
-- TAPP_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAPP (Table)
--   TAPPVIEW (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_UPDATE" 
AFTER  UPDATE  ON ASU.TAPP REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  UPDATE tappview
     SET fc_opis = :new.fc_opis,
         fc_ver = :new.fc_ver,
         fc_name = :new.fc_name
   WHERE fk_id = :new.fk_id;
END;
/
SHOW ERRORS;


