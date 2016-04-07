DROP TRIGGER ASU.TRECEPTION_BEFORE_INSERT
/

--
-- TRECEPTION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TRECEPTION (Sequence)
--   TRECEPTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON treception
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_TRECEPTION
    if :new.FK_ID is null then
      select SEQ_TRECEPTION.NEXTVAL INTO :new.FK_ID from dual;
          end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


