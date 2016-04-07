DROP TRIGGER ASU.TSTANDART_HEAL$BI
/

--
-- TSTANDART_HEAL$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART_HEAL (Table)
--   SEQ_STANDART_HEAL (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_HEAL$BI" before insert
on ASU.TSTANDART_HEAL for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_HEAL
    if :new.FK_ID is null then
      select SEQ_STANDART_HEAL.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


