DROP TRIGGER ASU.TKAB_KIOSK_BEF_INS
/

--
-- TKAB_KIOSK_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKAB_KIOSK (Sequence)
--   TKAB_KIOSK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKAB_KIOSK_BEF_INS" 
  before insert on tkab_kiosk
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

 if :NEW.FK_ID is null then
  SELECT SEQ_tkab_kiosk.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 end if;

end tkab_kiosk_bef_ins;
/
SHOW ERRORS;


