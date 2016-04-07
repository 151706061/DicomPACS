DROP TRIGGER ASU.TMEDKART$INS
/

--
-- TMEDKART$INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TMEDKART (Sequence)
--   TMEDKART (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDKART$INS" 
BEFORE INSERT
ON ASU.TMEDKART REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_TMEDKART.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


