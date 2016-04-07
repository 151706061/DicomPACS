DROP TRIGGER ASU.TUSLUG_PAY_REQ_BEFORE_INSERT
/

--
-- TUSLUG_PAY_REQ_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_USLUG_PAY_REQ (Sequence)
--   TUSLUG_PAY_REQ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLUG_PAY_REQ_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tuslug_pay_req
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_USLUG_PAY_REQ
    if :new.FK_ID is null then
      select SEQ_USLUG_PAY_REQ.NEXTVAL INTO :new.FK_ID from dual;
    end if;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


