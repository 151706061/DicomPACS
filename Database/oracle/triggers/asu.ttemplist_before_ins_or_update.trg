DROP TRIGGER ASU.TTEMPLIST_BEFORE_INS_OR_UPDATE
/

--
-- TTEMPLIST_BEFORE_INS_OR_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TTEMPLIST (Sequence)
--   TTEMPLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTEMPLIST_BEFORE_INS_OR_UPDATE" 
  before insert or update on ttemplist
  for each row
declare
  -- local variables here
begin
  --  Column "FK_ID" uses sequence SEQ_TTEMPLIST
  IF :NEW.FK_ID IS NULL THEN
  SELECT SEQ_TTEMPLIST.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  :NEW.FD_CHANGED := SYSDATE;
end TTEMPLIST_BEFORE_INS_OR_UPDATE;
/
SHOW ERRORS;


