-- Start of DDL Script for Trigger MED.TKART_INS
-- Generated 27-окт-2010 13:58:42 from MED@sk100302

CREATE OR REPLACE TRIGGER med.tkart_ins
 BEFORE
  INSERT
 ON med.tkart
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  if :new.KARTID is null then
    select SEQ_TKART.nextval into :new.KARTID from dual;
  end if;

  begin
    if :new.fn_party_num is null then
      select (NVL(MAX(TKart.fn_party_num),0) + 1) into :new.fn_party_num from TKart where TKart.medicid = :new.medicid;
    end if;
  EXCEPTION
    WHEN OTHERS THEN
     :new.fn_party_num := :new.KARTID;
  end;
End;
/


-- End of DDL Script for Trigger MED.TKART_INS

