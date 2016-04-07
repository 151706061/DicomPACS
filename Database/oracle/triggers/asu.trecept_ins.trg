DROP TRIGGER ASU.TRECEPT_INS
/

--
-- TRECEPT_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECEPT (Sequence)
--   TRECEPT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_INS" 
BEFORE INSERT
ON trecept
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_trecept.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


