-- Start of DDL Script for Trigger MED.TUCHGR_DEL
-- Generated 05.12.2008 10:42:30 from MED@ASU

CREATE OR REPLACE TRIGGER med.tuchgr_del
 AFTER
  DELETE
 ON med.tuchgr
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  -- удаляем группу учетности из списока разрешений
  delete from MED.TMEDICS_BY_UCHRG_MOGROUP WHERE FK_UCHGR_ID = :OLD.UCHGRID;
end;
/


-- End of DDL Script for Trigger MED.TUCHGR_DEL

