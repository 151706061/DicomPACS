DROP TRIGGER ASU.TDIKTTSK_INSERT
/

--
-- TDIKTTSK_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDIKTTASK (Sequence)
--   TDIKTTASKS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIKTTSK_INSERT" 
BEFORE  INSERT  ON ASU.TDIKTTASKS FOR EACH ROW
Begin
  select SEQ_TDIKTTASK.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


