DROP TRIGGER ASU.TEFFECT_BEFORE_INSERT
/

--
-- TEFFECT_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TEFFECT (Sequence)
--   TEFFECT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEFFECT_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TEFFECT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  select seq_teffect.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


