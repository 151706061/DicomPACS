DROP TRIGGER ASU.TSMID_TEMPLATES_SMID_BEFOR_INS
/

--
-- TSMID_TEMPLATES_SMID_BEFOR_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_NAZN_TEMPL_SMID (Sequence)
--   TSMID_TEMPLATES_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_TEMPLATES_SMID_BEFOR_INS" 
 BEFORE
  INSERT
 ON asu.tsmid_templates_smid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_TEMPL_SMID
    if :new.FK_ID is null then
      select SEQ_NAZN_TEMPL_SMID.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


