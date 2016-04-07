DROP TRIGGER ASU.TBRON_PEOPLE$BD
/

--
-- TBRON_PEOPLE$BD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TBRON_NAZ (Table)
--   TBRON_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_PEOPLE$BD" before delete
on ASU.TBRON_PEOPLE for each row
begin
  delete from asu.tbron_naz n where n.fk_bron_people = :old.fk_id;
end;
/
SHOW ERRORS;


