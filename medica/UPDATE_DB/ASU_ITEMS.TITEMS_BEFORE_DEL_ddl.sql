-- Start of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_DEL
-- Generated 29-ноя-2008 10:18:45 from ASU_ITEMS@ASU

CREATE OR REPLACE TRIGGER asu_items.titems_before_del
 BEFORE
  DELETE
 ON asu_items.titems
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
  RecCount NUMBER;
begin
select count(1) as k into RecCount from
  (select k.kartid As FK_ID
  from med.tmedic m, med.tkart k
  where
      m.fk_titems = :OLD.FK_ID
  and k.medicid = m.medicid
UNION ALL
  SELECT t.fk_medicid As FK_ID
  from med.tmedic m, med.ttreb_dpc t
  where
      m.fk_titems = :OLD.FK_ID
  and t.fk_medicid = m.medicid);

  IF RecCount = 0 then
    delete from med.tmedic m where m.fk_titems = :OLD.FK_ID;
  else
    update med.tmedic m set m.fl_visible = 0 where m.fk_titems = :OLD.FK_ID;
  end if;
end;
/


-- End of DDL Script for Trigger ASU_ITEMS.TITEMS_AFTER_DEL

