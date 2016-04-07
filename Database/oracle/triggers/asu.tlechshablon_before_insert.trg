DROP TRIGGER ASU.TLECHSHABLON_BEFORE_INSERT
/

--
-- TLECHSHABLON_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TLECHSHABLON (Sequence)
--   TLECHSHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLECHSHABLON_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TLECHSHABLON REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
begin
 SELECT SEQ_TLECHSHABLON.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;

