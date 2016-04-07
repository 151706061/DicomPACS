DROP TRIGGER ASU.TXRAY_TEMPLATE_RECOM_BI
/

--
-- TXRAY_TEMPLATE_RECOM_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TXRAY_TEMPLATE_RECOM (Sequence)
--   TXRAY_TEMPLATE_RECOM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TXRAY_TEMPLATE_RECOM_BI" 
 BEFORE
  INSERT
 ON asu.txray_template_recom
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select asu.seq_txray_template_recom.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


