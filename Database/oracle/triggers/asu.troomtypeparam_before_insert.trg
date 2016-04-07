DROP TRIGGER ASU."Troomtypeparam_BEFORE_INSERT"
/

--
-- "Troomtypeparam_BEFORE_INSERT"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TROOMTYPEPARAM (Table)
--
CREATE OR REPLACE TRIGGER ASU."Troomtypeparam_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.Troomtypeparam
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT asu.Seq_Troomtypeparam.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


