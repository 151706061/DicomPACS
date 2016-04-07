-- Start of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_UPD
-- Generated 30-ноя-2008 18:51:37 from ASU_ITEMS@ASU

CREATE OR REPLACE TRIGGER asu_items.titems_after_upd
 AFTER
  UPDATE
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
--  update med.tmedic m
--  set FC_NAME = :NEW.FC_MODEL,
--      FL_EQUIPMENT = 1
--  where FK_TITEMS = :NEW.FK_ID;
 null;
end;
/


-- End of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_UPD

