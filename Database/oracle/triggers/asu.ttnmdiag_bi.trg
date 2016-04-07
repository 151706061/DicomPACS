DROP TRIGGER ASU.TTNMDIAG_BI
/

--
-- TTNMDIAG_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TTNMDIAG (Sequence)
--   TTNMDIAG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTNMDIAG_BI" 
  before insert on asu.ttnmdiag
  referencing new as new
  for each row
begin
  if :new.fk_id is null then
    select seq_ttnmdiag.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


