DROP TRIGGER ASU.TNAZRECEPT_INS
/

--
-- TNAZRECEPT_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZRECEPT (Sequence)
--   TNAZRECEPT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZRECEPT_INS" 
BEFORE INSERT
ON ASU.TNAZRECEPT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_tnazrecept.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


