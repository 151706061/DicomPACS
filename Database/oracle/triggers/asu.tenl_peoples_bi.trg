DROP TRIGGER ASU.TENL_PEOPLES_BI
/

--
-- TENL_PEOPLES_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TENL_PEOPLES (Sequence)
--   TENL_PEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU.TENL_PEOPLES_BI
  before insert ON ASU.TENL_PEOPLES   REFERENCING OLD AS OLD NEW AS NEW
  for each ROW
begin
  SELECT asu.seq_tenl_peoples.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


