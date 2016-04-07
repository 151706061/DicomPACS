DROP TRIGGER ASU.TRECIPE_DLO_IMP_INS
/

--
-- TRECIPE_DLO_IMP_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_DLO_IMP (Sequence)
--   TRECIPE_DLO_IMP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_IMP_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_IMP REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_IMP.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


