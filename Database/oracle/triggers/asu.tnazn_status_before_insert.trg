DROP TRIGGER ASU.TNAZN_STATUS_BEFORE_INSERT
/

--
-- TNAZN_STATUS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TNAZN_STATUS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_STATUS_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON asu.tnazn_status
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
  Return;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


