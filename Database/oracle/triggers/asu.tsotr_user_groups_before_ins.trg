DROP TRIGGER ASU.TSOTR_USER_GROUPS_BEFORE_INS
/

--
-- TSOTR_USER_GROUPS_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TSOTR_USER_GROUPS (Table)
--   SEQ_SOTR_USER_GROUPS (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSOTR_USER_GROUPS_BEFORE_INS" 
 BEFORE
  INSERT
 ON asu.tsotr_user_groups
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_SOTR_USER_GROUPS
    if :new.FK_ID is null then
      select SEQ_SOTR_USER_GROUPS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


