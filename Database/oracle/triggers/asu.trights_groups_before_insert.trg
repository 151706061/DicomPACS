DROP TRIGGER ASU.TRIGHTS_GROUPS_BEFORE_INSERT
/

--
-- TRIGHTS_GROUPS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_USER_RIGHTS (Sequence)
--   TRIGHTS_GROUPS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRIGHTS_GROUPS_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.trights_groups FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_USER_RIGHTS
    if :new.FK_ID is null then
      select SEQ_USER_RIGHTS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


