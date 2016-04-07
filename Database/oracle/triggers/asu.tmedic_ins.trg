DROP TRIGGER ASU.TMEDIC_INS
/

--
-- TMEDIC_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMEDIC (Sequence)
--   TMEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDIC_INS" 
BEFORE  INSERT  ON ASU.TMEDIC FOR EACH ROW
Begin
  select seq_tmedic.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


