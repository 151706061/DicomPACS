DROP TRIGGER ASU.TBRON_PEOPLE$BI
/

--
-- TBRON_PEOPLE$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TBRON_PEOPLE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_PEOPLE$BI" before insert
on ASU.TBRON_PEOPLE for each row
begin
  --  Column "FK_ID" uses sequence ASU.SEQ_TBRON_PEOPLE
  if :new.FK_ID is null then
    select ASU.SEQ_TKARTA.NEXTVAL INTO :new.FK_ID from dual;
  end if;
end;
/
SHOW ERRORS;


