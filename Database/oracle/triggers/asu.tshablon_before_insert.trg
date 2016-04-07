DROP TRIGGER ASU.TSHABLON_BEFORE_INSERT
/

--
-- TSHABLON_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSHABLON (Sequence)
--   TSHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSHABLON_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSHABLON   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tshablon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


