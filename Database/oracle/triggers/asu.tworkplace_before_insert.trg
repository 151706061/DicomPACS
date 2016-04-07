DROP TRIGGER ASU.TWORKPLACE_BEFORE_INSERT
/

--
-- TWORKPLACE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TWORKPLACE (Sequence)
--   TWORKPLACE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TWORKPLACE_BEFORE_INSERT" 
  before insert on tworkplace
  for each row
declare
  -- local variables here
begin
  SELECT SEQ_TWORKPLACE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
end TWORKPLACE_BEFORE_INSERT;
/
SHOW ERRORS;


