DROP TRIGGER ASU.TCONST_BEFORE_INSERT
/

--
-- TCONST_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TCONST (Sequence)
--   TCONST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCONST_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TCONST   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tconst.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


