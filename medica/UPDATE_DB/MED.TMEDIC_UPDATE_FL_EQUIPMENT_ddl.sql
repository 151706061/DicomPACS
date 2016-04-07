-- Start of DDL Script for Trigger MED.TMEDIC_UPDATE_FL_EQUIPMENT
-- Generated 30-ноя-2008 18:57:23 from MED@ASU

CREATE OR REPLACE TRIGGER med.tmedic_update_fl_equipment
 BEFORE
   UPDATE OF fl_equipment
 ON med.tmedic
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:OLD.FK_TITEMS is null) then
    if (:NEW.FL_EQUIPMENT = 1) then
      INSERT INTO ASU_ITEMS.TITEMS (FC_MODEL, FN_DELETED) values(:NEW.FC_NAME, 0) returning FK_ID into :NEW.FK_TITEMS;
    end if;
  else
    if (:NEW.FL_EQUIPMENT = 0) then
      UPDATE ASU_ITEMS.TITEMS set FN_DELETED = 1 where FK_ID = :OLD.FK_TITEMS;
    end if;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TMEDIC_UPDATE_FL_EQUIPMENT

