DROP TRIGGER ASU.TCATEGORY$BI
/

--
-- TCATEGORY$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TCATEGORY (Table)
--   SEQ_CATEGORY (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TCATEGORY$BI" before insert
on ASU.TCATEGORY for each row
begin
    --  Column "FK_ID" uses sequence SEQ_CATEGORY
    if :new.FK_ID is null then
      select SEQ_CATEGORY.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


