DROP TRIGGER ASU.TCONTACTS_BEFORE_INSERT
/

--
-- TCONTACTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TCONTACTS (Sequence)
--   TCONTACTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCONTACTS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tcontacts
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select seq_tcontacts.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


