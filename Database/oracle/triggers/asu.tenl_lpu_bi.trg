DROP TRIGGER ASU.TENL_LPU_BI
/

--
-- TENL_LPU_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TENL_LPU (Sequence)
--   TENL_LPU (Table)
--
CREATE OR REPLACE TRIGGER ASU.TENL_LPU_BI
  before insert ON ASU.TENL_LPU   REFERENCING OLD AS OLD NEW AS NEW
  for each ROW
begin
  SELECT asu.seq_tenl_lpu.nextval INTO :new.fk_id FROM dual;
END;
/
SHOW ERRORS;


