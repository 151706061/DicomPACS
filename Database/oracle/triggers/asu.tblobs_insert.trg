DROP TRIGGER ASU.TBLOBS_INSERT
/

--
-- TBLOBS_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TBLOBS (Sequence)
--   TBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBLOBS_INSERT" 
BEFORE  INSERT  ON ASU.TBLOBS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  select seq_tblobs.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


