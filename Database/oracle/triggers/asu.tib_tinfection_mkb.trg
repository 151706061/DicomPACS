DROP TRIGGER ASU."tib_tinfection_mkb"
/

--
-- "tib_tinfection_mkb"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TINFECTION_MKB (Sequence)
--   TINFECTION_MKB (Table)
--
CREATE OR REPLACE TRIGGER ASU."tib_tinfection_mkb" before insert
on TINFECTION_MKB for each row
begin
    --  Column "FK_ID" uses sequence SEQ_TINFECTION_MKB
    if :new.FK_ID is null then
      select SEQ_TINFECTION_MKB.NEXTVAL INTO :new.FK_ID from dual;
    end if;


end;
/
SHOW ERRORS;


