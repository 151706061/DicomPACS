DROP TRIGGER ASU.TENL_NAZAN_BI
/

--
-- TENL_NAZAN_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TENL_NAZAN (Sequence)
--   TENL_NAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU.TENL_NAZAN_BI
  before insert ON ASU.TENL_NAZAN   REFERENCING OLD AS OLD NEW AS NEW
  for each ROW
begin
  SELECT asu.seq_tenl_nazan.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


