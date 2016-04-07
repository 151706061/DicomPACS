DROP TRIGGER ASU.TIBSTACK_INSERT
/

--
-- TIBSTACK_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TIBSTACK (Sequence)
--   TIBSTACK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBSTACK_INSERT" 
BEFORE  INSERT  ON ASU.TIBSTACK FOR EACH ROW
Begin
select seq_tibstack.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


