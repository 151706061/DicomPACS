DROP TRIGGER ASU.TAUDIT_INSERT
/

--
-- TAUDIT_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TAUDIT (Sequence)
--   TAUDIT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAUDIT_INSERT" 
BEFORE  INSERT  ON ASU.TAUDIT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  select seq_taudit.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


