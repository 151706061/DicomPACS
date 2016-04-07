DROP TRIGGER ASU.TBRON_NAZ$BI
/

--
-- TBRON_NAZ$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TBRON_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBRON_NAZ$BI" before insert
on ASU.TBRON_NAZ for each row
begin
  --  Column "FK_ID" uses sequence SEQ_TKARTA
  if :new.FK_ID is null then
    select SEQ_TKARTA.NEXTVAL INTO :new.FK_ID from dual;
  end if;
end;
/
SHOW ERRORS;


