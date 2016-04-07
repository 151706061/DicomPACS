DROP TRIGGER ASU.TNAZRECEPTCON_INS
/

--
-- TNAZRECEPTCON_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZRECEPTCON (Sequence)
--   TNAZRECEPTCON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZRECEPTCON_INS" 
BEFORE INSERT
ON ASU.TNAZRECEPTCON REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_tnazreceptcon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


