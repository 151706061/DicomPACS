DROP TRIGGER ASU.TIBTEXT_INS
/

--
-- TIBTEXT_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TIBTEXT (Sequence)
--   TIBTEXT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBTEXT_INS" 
  BEFORE INSERT
  ON ASU.TIBTEXT   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tibtext.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


