DROP TRIGGER ASU.TVACCANCEL_PREP$BI
/

--
-- TVACCANCEL_PREP$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TVACCANCEL_PREP (Sequence)
--   TVACCANCEL_PREP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVACCANCEL_PREP$BI" before insert
on TVACCANCEL_PREP for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_TVACCANCEL_PREP
    if :new.FK_ID is null then
      select SEQ_TVACCANCEL_PREP.NEXTVAL INTO :new.FK_ID from dual;
    end if;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


