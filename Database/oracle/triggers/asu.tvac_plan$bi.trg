DROP TRIGGER ASU.TVAC_PLAN$BI
/

--
-- TVAC_PLAN$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_VAC_PLAN (Sequence)
--   TVAC_PLAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TVAC_PLAN$BI" 
 BEFORE 
 INSERT
 ON ASU.TVAC_PLAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    --  Column "FK_ID" uses sequence SEQ_VAC_PLAN
    select SEQ_VAC_PLAN.NEXTVAL INTO :new.FK_ID from dual;
end;
/
SHOW ERRORS;


