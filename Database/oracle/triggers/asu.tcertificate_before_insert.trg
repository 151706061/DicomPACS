DROP TRIGGER ASU.TCERTIFICATE_BEFORE_INSERT
/

--
-- TCERTIFICATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TCERTIFICATE (Sequence)
--   TCERTIFICATE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCERTIFICATE_BEFORE_INSERT" 
  before insert
  on asu.tcertificate
  referencing new as new old as old
  for each row
begin
  select asu.seq_tcertificate.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


