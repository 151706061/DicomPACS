DROP TRIGGER ASU.TFARMGR
/

--
-- TFARMGR  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TFARMGR (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TFARMGR" 
BEFORE INSERT
ON tfarmgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_tfarmgr.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


