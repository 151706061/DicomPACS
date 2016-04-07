DROP TRIGGER ASU.TRECEPTION_FBLOBS_BEFOREINSERT
/

--
-- TRECEPTION_FBLOBS_BEFOREINSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_RECEPTION_FBLOBS (Sequence)
--   TRECEPTION_FBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_FBLOBS_BEFOREINSERT" 
 BEFORE INSERT
ON asu.treception_fblobs FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_RECEPTION_FBLOBS
    if :new.FK_ID is null then
      select SEQ_RECEPTION_FBLOBS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


