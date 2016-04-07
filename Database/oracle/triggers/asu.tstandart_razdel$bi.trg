DROP TRIGGER ASU.TSTANDART_RAZDEL$BI
/

--
-- TSTANDART_RAZDEL$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART_RAZDEL (Table)
--   SEQ_STANDART_RAZDEL (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_RAZDEL$BI" before insert
on ASU.TSTANDART_RAZDEL for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_RAZDEL
    if :new.FK_ID is null then
      select SEQ_STANDART_RAZDEL.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


