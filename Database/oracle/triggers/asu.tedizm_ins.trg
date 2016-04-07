DROP TRIGGER ASU.TEDIZM_INS
/

--
-- TEDIZM_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TEDIZM (Sequence)
--   TEDIZM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEDIZM_INS" 
BEFORE INSERT
ON ASU.TEDIZM REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_tedizm.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


