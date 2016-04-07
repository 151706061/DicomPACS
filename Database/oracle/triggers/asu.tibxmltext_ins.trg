DROP TRIGGER ASU.TIBXMLTEXT_INS
/

--
-- TIBXMLTEXT_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TIBTEXT (Sequence)
--   TIBXMLTEXT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBXMLTEXT_INS" 
 BEFORE 
 INSERT
 ON ASU.TIBXMLTEXT  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  select seq_tibtext.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


