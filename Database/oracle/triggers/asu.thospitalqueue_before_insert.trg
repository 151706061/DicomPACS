DROP TRIGGER ASU."thospitalqueue_before_insert"
/

--
-- "thospitalqueue_before_insert"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_THOSPITALQUEUE (Sequence)
--   THOSPITALQUEUE (Table)
--
CREATE OR REPLACE TRIGGER ASU."thospitalqueue_before_insert" 
  before insert on asu.thospitalqueue
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_thospitalqueue.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


