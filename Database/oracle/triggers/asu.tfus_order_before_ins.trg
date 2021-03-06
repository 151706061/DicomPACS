DROP TRIGGER ASU.TFUS_ORDER_BEFORE_INS
/

--
-- TFUS_ORDER_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TFUS_ORDER (Sequence)
--   TFUS_ORDER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFUS_ORDER_BEFORE_INS" 
 BEFORE
  INSERT
 ON asu.tfus_order
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
 SELECT SEQ_TFUS_ORDER.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


