DROP TRIGGER ASU.TNAZN_BEFORE_INSERT
/

--
-- TNAZN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_NAZN (Sequence)
--   TNAZN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN
    if :new.FK_ID is null then
      select SEQ_NAZN.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


