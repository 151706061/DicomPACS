DROP TRIGGER ASU.TRECIPE_DLO_PAC_KAT_INS
/

--
-- TRECIPE_DLO_PAC_KAT_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_DLO_PAC_KAT (Sequence)
--   TRECIPE_DLO_PAC_KAT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_PAC_KAT_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_PAC_KAT REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_PAC_KAT.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


