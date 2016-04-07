DROP TRIGGER ASU.TANONYM_ADDRESS$BI
/

--
-- TANONYM_ADDRESS$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TANONYM_ADDRESS (Table)
--   SEQ_ANONIM_ADDRESS (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TANONYM_ADDRESS$BI" before insert
on ASU.TANONYM_ADDRESS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence ASU.SEQ_ANONIM_ADDRESS
    select ASU.SEQ_ANONIM_ADDRESS.NEXTVAL INTO :new.FK_ID from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


