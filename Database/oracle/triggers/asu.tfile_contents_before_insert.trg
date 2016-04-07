DROP TRIGGER ASU.TFILE_CONTENTS_BEFORE_INSERT
/

--
-- TFILE_CONTENTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TFILE_CONTENTS (Table)
--   SEQ_FILE_CONTENTS (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TFILE_CONTENTS_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.tfile_contents FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_FILE_CONTENTS
    if :new.FK_ID is null then
      select SEQ_FILE_CONTENTS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


