DROP TRIGGER ASU.TDIAG_BEFORE_INSERT
/

--
-- TDIAG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDIAG (Sequence)
--   TDIAG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAG_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TDIAG   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tdiag.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


