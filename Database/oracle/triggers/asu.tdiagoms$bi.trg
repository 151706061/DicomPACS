DROP TRIGGER ASU.TDIAGOMS$BI
/

--
-- TDIAGOMS$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDIAGOMS (Sequence)
--   TDIAGOMS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAGOMS$BI" before insert
on ASU.TDIAGOMS for each row
begin
    --  Column "FK_ID" uses sequence SEQ_icd10_MODERN
    if :new.FK_ID is null then
      select ASU.SEQ_TDIAGOMS.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


