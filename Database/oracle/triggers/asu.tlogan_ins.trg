DROP TRIGGER ASU.TLOGAN_INS
/

--
-- TLOGAN_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TLOGMAN (Sequence)
--   TLOGMAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLOGAN_INS" 
 BEFORE 
 INSERT
 ON ASU.TLOGMAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin 
  select SEQ_Tlogman.nextval into :new.logmanid from dual;
End;
/
SHOW ERRORS;


