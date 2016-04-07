DROP TRIGGER ASU."TExSluchSaveGroups_INSERT"
/

--
-- "TExSluchSaveGroups_INSERT"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TEXSLUCHSAVEGROUPS (Sequence)
--   TEXSLUCHSAVEGROUPS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TExSluchSaveGroups_INSERT" 
 BEFORE
  INSERT
 ON asu.TExSluchSaveGroups
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT SEQ_TExSluchSaveGroups.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


