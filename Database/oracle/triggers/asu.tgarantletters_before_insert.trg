DROP TRIGGER ASU.TGARANTLETTERS_BEFORE_INSERT
/

--
-- TGARANTLETTERS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TINSURDOCS (Sequence)
--   TGARANTLETTERS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGARANTLETTERS_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TGARANTLETTERS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT SEQ_TINSURDOCS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;

