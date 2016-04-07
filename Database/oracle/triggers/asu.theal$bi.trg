DROP TRIGGER ASU.THEAL$BI
/

--
-- THEAL$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   THEAL (Table)
--   SEQ_HEAL (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."THEAL$BI" 
  BEFORE INSERT
  ON theal
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_heal.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


