DROP TRIGGER ASU.TRECIPE_MEDIC_INS
/

--
-- TRECIPE_MEDIC_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_RECIPE_MEDIC (Sequence)
--   TRECIPE_MEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_MEDIC_INS" 
 BEFORE
  INSERT
 ON ASU.trecipe_medic
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select asu.seq_recipe_medic.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


