DROP TRIGGER ASU.TBUNKINFO_BI
/

--
-- TBUNKINFO_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TBUNKINFO (Sequence)
--   TBUNKINFO (Table)
--
CREATE OR REPLACE TRIGGER ASU."TBUNKINFO_BI" 
  before insert on ASU.TBUNKINFO
 for each row
begin
  Select ASU.SEQ_TBUNKINFO.nextval into :new.FK_ID from DUAL;
 end;
/
SHOW ERRORS;


