DROP TRIGGER ASU.TNAPR_BEFORE_INSERT
/

--
-- TNAPR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAPR (Sequence)
--   TNAPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAPR_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TNAPR REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  SELECT SEQ_TNAPR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;

