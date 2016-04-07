-- Start of DDL Script for Trigger MED.TZAYAVKA_BEFORE_INS
-- Generated 26.11.2008 11:18:49 from MED@ASU

CREATE OR REPLACE TRIGGER med.tzayavka_before_ins
 BEFORE
  INSERT
 ON med.tzayavka
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  select SEQ_TZAYAVKA.nextval into :new.FK_ZAYAVID from dual;
  
  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TZAYAVKA_BEFORE_INS

