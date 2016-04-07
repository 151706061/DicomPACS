DROP TRIGGER ASU.TNAZSHAB_TIB_BEFORE_INSERT
/

--
-- TNAZSHAB_TIB_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TNAZSHAB_TIB (Sequence)
--   TNAZSHAB_TIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHAB_TIB_BEFORE_INSERT" 
BEFORE INSERT
ON tnazshab_tib
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_tnazshab_tib.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


