DROP TRIGGER ASU.TVACCANCEL_TYPE$BI
/

--
-- TVACCANCEL_TYPE$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_VAC_CANCEL_TYPE (Sequence)
--   TVACCANCEL_TYPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_TYPE$BI" before insert
on TVACCANCEL_TYPE for each row
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_CANCEL_TYPE
    if :new.FK_ID is null then
      select SEQ_VAC_CANCEL_TYPE.NEXTVAL INTO :new.FK_ID from dual;
    end if;

end;
/
SHOW ERRORS;


