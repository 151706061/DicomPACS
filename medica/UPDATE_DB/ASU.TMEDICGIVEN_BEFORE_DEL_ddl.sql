-- Start of DDL Script for Trigger ASU.TMEDIC_GIVEN_BEFORE_DEL
-- Generated 06.06.2008 17:58:30 from ASU@ASU

CREATE OR REPLACE TRIGGER ASU.TMEDICGIVEN_BEFORE_DEL
 BEFORE 
 DELETE
 ON TMEDICGIVEN
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  delete from asu.tnazmark nm where nm.fk_id = :old.FK_NAZMARK;
end;
/

quit
/
-- End of DDL Script for Trigger ASU.TMEDIC_GIVEN_BEFORE_DEL

