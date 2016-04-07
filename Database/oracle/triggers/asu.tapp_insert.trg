DROP TRIGGER ASU.TAPP_INSERT
/

--
-- TAPP_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TAPP (Table)
--   TAPPVIEW (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPP_INSERT" 
AFTER  INSERT  ON ASU.TAPP REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  INSERT INTO tappview (fk_id, fc_name, fc_opis, fc_ver)
       VALUES (:new.fk_id, :new.fc_name, :new.fc_opis, :new.fc_ver);
END;
/
SHOW ERRORS;


