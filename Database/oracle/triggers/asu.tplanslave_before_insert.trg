DROP TRIGGER ASU.TPLANSLAVE_BEFORE_INSERT
/

--
-- TPLANSLAVE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPLANSLAVE (Sequence)
--   TPLANSLAVE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPLANSLAVE_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPLANSLAVE REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TPLANSLAVE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

