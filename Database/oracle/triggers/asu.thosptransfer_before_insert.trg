DROP TRIGGER ASU."thosptransfer_before_insert"
/

--
-- "thosptransfer_before_insert"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_THOSPITALTRANSFER (Sequence)
--   THOSPITALTRANSFER (Table)
--
CREATE OR REPLACE TRIGGER ASU."thosptransfer_before_insert" 
  before insert on asu.thospitaltransfer
  REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  select asu.seq_thospitaltransfer.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


