DROP TRIGGER ASU.TRECIPE_DLO_IMP_MEDIC_INS
/

--
-- TRECIPE_DLO_IMP_MEDIC_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_DLO_IMP_MEDIC (Sequence)
--   TRECIPE_DLO_IMP_MEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_IMP_MEDIC_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_IMP_MEDIC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_IMP_MEDIC.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


