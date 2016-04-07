DROP TRIGGER ASU.TPAY_TYPE_SPR_BI
/

--
-- TPAY_TYPE_SPR_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPAY_TYPE_SPR (Sequence)
--   TPAY_TYPE_SPR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPAY_TYPE_SPR_BI"
 BEFORE
  INSERT
 ON ASU.TPAY_TYPE_SPR REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TPAY_TYPE_SPR.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


