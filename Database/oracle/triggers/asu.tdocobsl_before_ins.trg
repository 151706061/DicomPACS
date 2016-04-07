DROP TRIGGER ASU.TDOCOBSL_BEFORE_INS
/

--
-- TDOCOBSL_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDOCOBSL (Sequence)
--   TDOCOBSL (Table)
--   GET_CURRENT_LPU (Function)
--
CREATE OR REPLACE TRIGGER ASU."TDOCOBSL_BEFORE_INS" 
 BEFORE
 INSERT
 ON ASU.TDOCOBSL  REFERENCING OLD AS old NEW AS new
 FOR EACH ROW
Begin
  SELECT SEQ_TDOCOBSL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  if :New.fk_lpu is null then
    :New.fk_lpu:= asu.get_current_lpu;
  end if;    
End;
/
SHOW ERRORS;


