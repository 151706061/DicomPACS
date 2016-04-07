DROP TRIGGER ASU.TSTANDART_PHARMGR$BI
/

--
-- TSTANDART_PHARMGR$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART_PHARMGR (Table)
--   SEQ_STANDART_PHARMGR (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_PHARMGR$BI" before insert
on ASU.TSTANDART_PHARMGR for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_PHARMGR
    if :new.FK_ID is null then
      select SEQ_STANDART_PHARMGR.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


