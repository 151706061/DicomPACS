DROP TRIGGER ASU.TKORP_AFTER_UPDATE
/

--
-- TKORP_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TROOM (Table)
--   TKORP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKORP_AFTER_UPDATE" 
AFTER UPDATE
ON ASU.TKORP REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
--This is trigger for manual using only. It must be disabled!!!!
  UPDATE TROOM SET FK_KORPID = :NEW.FK_ID where FK_KORPID = :OLD.FK_ID;
End;
/
SHOW ERRORS;


