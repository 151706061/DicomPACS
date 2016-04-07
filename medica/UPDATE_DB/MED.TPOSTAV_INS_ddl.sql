-- Start of DDL Script for Trigger MED.TPOSTAV_INS
-- Generated 26.11.2008 11:14:31 from MED@ASU

CREATE OR REPLACE TRIGGER med.tpostav_ins
 BEFORE
  INSERT
 ON med.tpostav
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin 
  select SEQ_TPOSTAV.nextval into :new.POSTAVID from dual;
  
  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;
End;
/


-- End of DDL Script for Trigger MED.TPOSTAV_INS

