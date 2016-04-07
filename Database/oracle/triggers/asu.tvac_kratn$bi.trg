DROP TRIGGER ASU.TVAC_KRATN$BI
/

--
-- TVAC_KRATN$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_VAC_KRATN (Sequence)
--   TVAC_KRATN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_KRATN$BI" before insert
on TVAC_KRATN for each row
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_KRATN
    select SEQ_VAC_KRATN.NEXTVAL INTO :new.FK_ID from dual;
end;
/
SHOW ERRORS;


