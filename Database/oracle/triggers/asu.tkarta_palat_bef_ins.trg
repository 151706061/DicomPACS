DROP TRIGGER ASU.TKARTA_PALAT_BEF_INS
/

--
-- TKARTA_PALAT_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA_PALAT (Sequence)
--   TKARTA_PALAT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_PALAT_BEF_INS" 
  before insert on asu.TKarta_Palat
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

   SELECT SEQ_TKarta_Palat.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

   :new.FC_KORP := upper(:new.FC_KORP);

end;
/
SHOW ERRORS;


