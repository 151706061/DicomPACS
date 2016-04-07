DROP TRIGGER ASU.TFILE_CONTENT_BEFORE_UPDATE
/

--
-- TFILE_CONTENT_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TFILE_CONTENTS (Table)
--   INTEGRITYPACKAGE (Package)
--
CREATE OR REPLACE TRIGGER ASU."TFILE_CONTENT_BEFORE_UPDATE" 
 BEFORE UPDATE
OF FK_ID
ON asu.tfile_contents FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
begin
    seq := IntegrityPackage.GetNestLevel;
    :new.FD_DATE:=sysdate ;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


