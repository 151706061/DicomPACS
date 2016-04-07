DROP TRIGGER ASU.TS_QUEUEWINDOWS_BI
/

--
-- TS_QUEUEWINDOWS_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TS_QUEUEWINDOWS (Sequence)
--   TS_QUEUEWINDOWS (Table)
--
CREATE OR REPLACE TRIGGER ASU.ts_queuewindows_bi
  before insert ON ASU.TS_QUEUEWINDOWS   referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ts_queuewindows.nextval into :new.fk_id from dual;
  end if;
end ts_queuewindows_bi;
/
SHOW ERRORS;


