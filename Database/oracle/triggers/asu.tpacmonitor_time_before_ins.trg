DROP TRIGGER ASU.TPACMONITOR_TIME_BEFORE_INS
/

--
-- TPACMONITOR_TIME_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPACMONITOR_TIME (Sequence)
--   TPACMONITOR_TIME (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACMONITOR_TIME_BEFORE_INS" 
 BEFORE
  INSERT
 ON tpacmonitor_time
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tpacmonitor_time.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


