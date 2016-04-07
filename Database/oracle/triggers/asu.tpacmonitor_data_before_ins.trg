DROP TRIGGER ASU.TPACMONITOR_DATA_BEFORE_INS
/

--
-- TPACMONITOR_DATA_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPACMONITOR_DATA (Sequence)
--   TPACMONITOR_DATA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPACMONITOR_DATA_BEFORE_INS" 
 BEFORE
  INSERT
 ON tpacmonitor_data
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_tpacmonitor_data.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


