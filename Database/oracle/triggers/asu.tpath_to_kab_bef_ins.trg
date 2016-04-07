DROP TRIGGER ASU.TPATH_TO_KAB_BEF_INS
/

--
-- TPATH_TO_KAB_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TPATH_TO_KAB (Sequence)
--   TPATH_TO_KAB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPATH_TO_KAB_BEF_INS" 
  before insert on asu.tpath_to_kab
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

   SELECT SEQ_TPATH_TO_KAB.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

end TPath_to_kab;
/
SHOW ERRORS;


