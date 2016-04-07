DROP TRIGGER ASU.TSTOMPOS_INS
/

--
-- TSTOMPOS_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSTOMPOS (Sequence)
--   TSTOMPOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTOMPOS_INS" 
  BEFORE INSERT ON tstompos
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tstompos.nextval, seq_tstompos.nextval
    into :new.fk_id, :new.stomposid
    from dual;
  --select seq_tstompos.nextval into :new.stomposid from dual; by TimurLan
End;
/
SHOW ERRORS;


