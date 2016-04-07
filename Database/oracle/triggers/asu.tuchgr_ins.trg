DROP TRIGGER ASU.TUCHGR_INS
/

--
-- TUCHGR_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TUCHGR (Sequence)
--   TUCHGR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUCHGR_INS" 
BEFORE INSERT
ON tuchgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_tuchgr.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


