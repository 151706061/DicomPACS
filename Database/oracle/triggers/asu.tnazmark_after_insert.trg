DROP TRIGGER ASU.TNAZMARK_AFTER_INSERT
/

--
-- TNAZMARK_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   CORRECT_TNAZMED_STATE (Procedure)
--   TNAZMARK (Table)
--   TNAZMED (Table)
--
CREATE OR REPLACE TRIGGER ASU.tnazmark_after_insert
 AFTER
  INSERT
 ON ASU.TNAZMARK REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  update asu.tnazmed set FN_VIDANO = NVL(FN_VIDANO,0) + 1 where fk_id = :NEW.fk_nazid;
  asu.correct_tnazmed_state(:NEW.fk_nazid);
END TNAZMARK_BEFORE_INSERT;
/
SHOW ERRORS;


