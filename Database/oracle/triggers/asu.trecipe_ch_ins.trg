DROP TRIGGER ASU.TRECIPE_CH_INS
/

--
-- TRECIPE_CH_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE_CH (Sequence)
--   TRECIPE_CHANGE_HISTORY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_CH_INS" 
 BEFORE
 INSERT
 ON ASU.TRECIPE_CHANGE_HISTORY  FOR EACH ROW
begin
  if :new.fk_id is null then
    SELECT asu.seq_trecipe_ch.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
end;
/
SHOW ERRORS;


