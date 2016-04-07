DROP TRIGGER ASU.TRECEPT_USLUG_BEFORE_INSERT
/

--
-- TRECEPT_USLUG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TRECEPT_USLUG (Sequence)
--   TRECEPT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_USLUG_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.trecept_uslug FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_TRECEPT_USLUG
    if :new.FK_ID is null then
      select SEQ_TRECEPT_USLUG.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


