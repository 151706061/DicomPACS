DROP TRIGGER ASU.TONKOUCHET_BI
/

--
-- TONKOUCHET_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TONKOUCHET (Sequence)
--   TONKOUCHET (Table)
--
CREATE OR REPLACE TRIGGER ASU.TONKOUCHET_BI
  before insert ON ASU.TONKOUCHET   REFERENCING NEW AS NEW OLD AS OLD
  for each row
declare
  -- local variables here
begin
  if (:new.fk_id is null) then
     select asu.seq_tonkouchet.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


