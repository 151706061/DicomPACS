DROP TRIGGER ASU.TSLREQUEST_BEFORE_INSERT
/

--
-- TSLREQUEST_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSLREQUEST (Sequence)
--   TSLREQUEST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLREQUEST_BEFORE_INSERT" 
  before insert on tslrequest
  for each row
begin
  SELECT seq_tslrequest.NEXTVAL INTO :NEW.FK_ID FROM dual;
end TSLREQUEST_BEFORE_INSERT;
/
SHOW ERRORS;


