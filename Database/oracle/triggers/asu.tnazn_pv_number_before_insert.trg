DROP TRIGGER ASU.TNAZN_PV_NUMBER_BEFORE_INSERT
/

--
-- TNAZN_PV_NUMBER_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_NAZN_PV (Sequence)
--   TNAZN_PV_NUMBER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_PV_NUMBER_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.tnazn_pv_number FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_PV
    if :new.FK_ID is null then
      select SEQ_NAZN_PV.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


