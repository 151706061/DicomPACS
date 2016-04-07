DROP TRIGGER ASU.TREPETITION$BI
/

--
-- TREPETITION$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_REPETITION (Sequence)
--   TREPETITION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPETITION$BI" before insert
on ASU.TREPETITION for each row
begin
    --  Column "FK_ID" uses sequence SEQ_REPETITION
    if :new.FK_ID is null then
      select SEQ_REPETITION.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


