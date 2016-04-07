DROP TRIGGER ASU.TSTANDART_TIPROOM$BI
/

--
-- TSTANDART_TIPROOM$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART_TIPROOM (Table)
--   SEQ_STANDART_TIPROOM (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_TIPROOM$BI" before insert
on ASU.TSTANDART_TIPROOM for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_TIPROOM
    if :new.FK_ID is null then
      select SEQ_STANDART_TIPROOM.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


