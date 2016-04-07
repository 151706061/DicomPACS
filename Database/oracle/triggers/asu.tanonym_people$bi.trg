DROP TRIGGER ASU.TANONYM_PEOPLE$BI
/

--
-- TANONYM_PEOPLE$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TANONYM_PEOPLE (Table)
--   SEQ_ANONIM_PEOPLE (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TANONYM_PEOPLE$BI" before insert
on ASU.TANONYM_PEOPLE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence ASU.SEQ_ANONIM_PEOPLE
    select ASU.SEQ_ANONIM_PEOPLE.NEXTVAL INTO :new.FK_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


