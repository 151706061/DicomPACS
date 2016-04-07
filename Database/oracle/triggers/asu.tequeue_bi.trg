DROP TRIGGER ASU.TEQUEUE_BI
/

--
-- TEQUEUE_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TEQUEUE (Sequence)
--   TEQUEUE (Table)
--
CREATE OR REPLACE TRIGGER ASU.tequeue_bi
  before insert ON ASU.TEQUEUE   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_tequeue.nextval into :new.fk_id from dual;
  end if;
end tequeue_bi;
/
SHOW ERRORS;


