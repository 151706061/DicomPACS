DROP TRIGGER ASU.TRECIPE_DLO_EXP_INS
/

--
-- TRECIPE_DLO_EXP_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_DLO_EXP (Sequence)
--   TRECIPE_DLO_EXP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_INS" 
 BEFORE
  INSERT
 ON asu.trecipe_dlo_exp
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select ASU.SEQ_TRECIPE_DLO_EXP.NEXTVAL into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


