-- Start of DDL Script for Trigger MED.TIMP_DOC_UPD
-- Generated 5-окт-2009 10:01:14 from MED@ASU

CREATE OR REPLACE TRIGGER med.timp_doc_upd
 BEFORE
  UPDATE
 ON med.timp_doc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  :NEW.FD_EDIT_DATE := sysdate;
  :new.FK_EDIT_MO   := med.pkg_medses.get_curmo;
  if (:new.FL_CHECK_DOGOVOR = 1)and(:new.FL_IS_CHECKED = 1) then
    :new.FK_MO_CHECKED := med.pkg_medses.get_curmo;
    :new.FD_CHECKED_DATE := sysdate;
  end if;
  if (:old.FL_IS_CHECKED=1)and(:new.FL_IS_CHECKED=0) then
    :new.FL_IS_CHECKED := 1;
  end if;
  
  if (:old.FL_CHECK_DOGOVOR = 1)and(:old.FL_IS_CHECKED=1)and(:new.FL_CHECK_DOGOVOR=0) then
    :new.FL_CHECK_DOGOVOR := 1;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TIMP_DOC_UPD

