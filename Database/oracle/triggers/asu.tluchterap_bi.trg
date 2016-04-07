DROP TRIGGER ASU.TLUCHTERAP_BI
/

--
-- TLUCHTERAP_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TLUCHTERAP (Sequence)
--   TLUCHTERAP (Table)
--
CREATE OR REPLACE TRIGGER ASU.TLUCHTERAP_BI
  before insert ON ASU.TLUCHTERAP   REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_tluchterap.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


