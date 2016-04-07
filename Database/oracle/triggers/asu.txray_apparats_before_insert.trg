DROP TRIGGER ASU.TXRAY_APPARATS_BEFORE_INSERT
/

--
-- TXRAY_APPARATS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TXRAY_APPARATS (Sequence)
--   TXRAY_APPARATS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TXRAY_APPARATS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.txray_apparats
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select seq_txray_apparats.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


