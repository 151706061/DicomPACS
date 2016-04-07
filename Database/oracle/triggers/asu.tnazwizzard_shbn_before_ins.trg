DROP TRIGGER ASU.TNAZWIZZARD_SHBN_BEFORE_INS
/

--
-- TNAZWIZZARD_SHBN_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZWIZZARD_SHBN (Sequence)
--   TNAZWIZZARD_SHBN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_SHBN_BEFORE_INS" 
 BEFORE
  INSERT
 ON tnazwizzard_shbn
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_tnazwizzard_shbn.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


