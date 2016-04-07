DROP TRIGGER ASU.TSTANDART_ICD10$BI
/

--
-- TSTANDART_ICD10$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TSTANDART_ICD10 (Table)
--   SEQ_STANDART_ICD10 (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_ICD10$BI" before insert
on ASU.TSTANDART_ICD10 for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_ICD10
    if :new.FK_ID is null then
      select SEQ_STANDART_ICD10.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


