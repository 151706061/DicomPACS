DROP TRIGGER ASU.TNAZN_FBLOBS_BEFORE_INSERT
/

--
-- TNAZN_FBLOBS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_NAZN_FBLOBS (Sequence)
--   TNAZN_FBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_FBLOBS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazn_fblobs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_FBLOBS
    if :new.FK_ID is null then
      select SEQ_NAZN_FBLOBS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


