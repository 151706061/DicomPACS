-- Start of DDL Script for Trigger MED.TPRODCERT_INS
-- Generated 12-май-2009 15:33:30 from MED@ASU

CREATE OR REPLACE TRIGGER med.tprodcert_ins
 BEFORE
  INSERT
 ON med.tprodcert
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;
  
  if :NEW.FK_ID is null then
    select med.SEQ_TPRODCERT.NEXTVAL into :NEW.FK_ID from dual;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TPRODCERT_INS

