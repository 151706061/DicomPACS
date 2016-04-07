DROP TRIGGER ASU."TarifDetail_INSERT"
/

--
-- "TarifDetail_INSERT"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TARIFDETAIL (Sequence)
--   TARIFDETAIL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TarifDetail_INSERT"
 BEFORE
  INSERT
 ON asu.TarifDetail
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.FK_ID IS NULL THEN
    SELECT asu.SEQ_TarifDetail.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


