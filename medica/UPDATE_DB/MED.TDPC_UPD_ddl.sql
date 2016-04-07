-- Start of DDL Script for Trigger MED.TDPC_UPD
-- Generated 4-фев-2010 13:55:55 from MED@h091003c

CREATE OR REPLACE TRIGGER med.tdpc_upd
 BEFORE
  UPDATE
 ON med.tdpc
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  :NEW.FK_EDIT_MO_ID := med.pkg_medses.get_curmo;
  :NEW.FD_EDIT       := sysdate;
end;
/


-- End of DDL Script for Trigger MED.TDPC_UPD

