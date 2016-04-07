DROP TRIGGER ASU.TVACCANCEL_INF$BI
/

--
-- TVACCANCEL_INF$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TVACCANCEL_INF (Sequence)
--   TVACCANCEL_INF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_INF$BI" before insert
on TVACCANCEL_INF for each row
begin
    --  Column "FK_ID" uses sequence SEQ_TVACCANCEL_INF
    if :new.FK_ID is null then
      select SEQ_TVACCANCEL_INF.NEXTVAL INTO :new.FK_ID from dual;
    end if;

end;
/
SHOW ERRORS;


