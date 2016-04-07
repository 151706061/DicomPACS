DROP TRIGGER ASU.TXRAY_LOG_BI
/

--
-- TXRAY_LOG_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TXRAY_LOG (Sequence)
--   TXRAY_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TXRAY_LOG_BI" 
 BEFORE
  INSERT
 ON asu.txray_log
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_txray_log.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


