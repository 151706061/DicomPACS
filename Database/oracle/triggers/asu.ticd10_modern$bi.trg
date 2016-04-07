DROP TRIGGER ASU."Ticd10_MODERN$BI"
/

--
-- "Ticd10_MODERN$BI"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_ICD10_MODERN (Sequence)
--   TICD10_MODERN (Table)
--
CREATE OR REPLACE TRIGGER ASU."Ticd10_MODERN$BI" before insert
on ASU.Ticd10_MODERN for each row
begin
    --  Column "FK_ID" uses sequence SEQ_icd10_MODERN
    if :new.FK_ID is null then
      select SEQ_icd10_MODERN.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


