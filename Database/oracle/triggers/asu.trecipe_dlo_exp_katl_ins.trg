DROP TRIGGER ASU.TRECIPE_DLO_EXP_KATL_INS
/

--
-- TRECIPE_DLO_EXP_KATL_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_DLO_EXP_KATL (Sequence)
--   TRECIPE_DLO_EXP_KATL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_KATL_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_EXP_KATL REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_EXP_KATL.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


