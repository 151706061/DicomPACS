DROP TRIGGER ASU.TS_QUEUETYPE_BI
/

--
-- TS_QUEUETYPE_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_QUEUETYPE (Sequence)
--   TS_QUEUETYPE (Table)
--
CREATE OR REPLACE TRIGGER ASU.ts_queuetype_bi
  before insert ON ASU.TS_QUEUETYPE   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_queuetype.nextval into :new.fk_id from dual;
  end if;
end ts_queuetype_bi;
/
SHOW ERRORS;


