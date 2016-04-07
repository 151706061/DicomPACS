DROP TRIGGER ASU.TIB_TICD10
/

--
-- TIB_TICD10  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_ICD10 (Sequence)
--   TICD10 (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIB_TICD10" before insert
on TICD10 for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_ICD10
    if :new.FK_ID is null then
      select SEQ_ICD10.NEXTVAL INTO :new.FK_ID from dual;
    end if;  

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


