-- Start of DDL Script for Trigger MED.TDOCS_INS
-- Generated 8-фев-2011 14:08:17 from MED@UN110204

CREATE OR REPLACE TRIGGER med.tdocs_ins
 BEFORE
  INSERT
 ON med.tdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  if :new.DPID is null then
    select SEQ_TDOCS.nextval into :new.DPID from dual;
  end if;

  if :NEW.FL_EDIT is null then
    :NEW.FL_EDIT := 1;
  end if;

  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;
End;
/


-- End of DDL Script for Trigger MED.TDOCS_INS

