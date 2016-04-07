DROP TRIGGER ASU.TSTANDART$BI
/

--
-- TSTANDART$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART (Table)
--   SEQ_STANDART (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART$BI" before insert
on ASU.TSTANDART for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART
    if :new.FK_ID is null then
      select SEQ_STANDART.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


