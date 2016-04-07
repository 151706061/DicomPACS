DROP TRIGGER ASU.TTNMSPR_BI
/

--
-- TTNMSPR_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TTNMSPR (Sequence)
--   TTNMSPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTNMSPR_BI" 
  before insert on asu.ttnmspr
  referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ttnmspr.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


