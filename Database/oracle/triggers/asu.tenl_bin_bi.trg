DROP TRIGGER ASU.TENL_BIN_BI
/

--
-- TENL_BIN_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TENL_BIN (Sequence)
--   TENL_BIN (Table)
--
CREATE OR REPLACE TRIGGER ASU.TENL_BIN_BI
  before insert ON ASU.TENL_BIN   REFERENCING OLD AS OLD NEW AS NEW
  for each ROW
begin
  SELECT asu.seq_tenl_bin.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


