DROP TRIGGER ASU.TILE_CONTENTS_BEFORE_UPDATE
/

--
-- TILE_CONTENTS_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TFILE_CONTENTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TILE_CONTENTS_BEFORE_UPDATE" 
 BEFORE UPDATE
OF FK_ID
ON asu.tfile_contents FOR EACH ROW
declare
    errno            integer;
    errmsg           char(200);
begin
    :new.FD_DATE:=sysdate;
    --Error handling
exception
    when others then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


