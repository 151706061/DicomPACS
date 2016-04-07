DROP TRIGGER ASU.TKARTA_TO_TIB$INSERT$UPD
/

--
-- TKARTA_TO_TIB$INSERT$UPD  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TCOUNTRY (Table)
--   TTOWN (Table)
--   TREGION (Table)
--   GET_SYNID (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_TO_TIB$INSERT$UPD" 
 AFTER
   INSERT OR UPDATE OF fk_countryid, fk_regionid, fk_townid
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
DECLARE
   CURSOR caddr IS
      SELECT /*+ rule*/ ttown.fc_name as fc_town, tregion.fc_name as fc_region, tcountry.fc_name as fc_country
        FROM ttown, tregion, tcountry
       WHERE ttown.fk_id = nvl(:new.fk_townid,1)
         AND tcountry.fk_id = nvl(:new.fk_countryid,1)
         AND tregion.fk_id = nvl(:new.fk_regionid,1);
BEGIN
--вставка в историю болезни данных эпиданамнеза
   for addr in cAddr loop
     delete from tib where fk_pacid=:old.fk_id and fk_smeditid=get_synid('EPID_PRYB_FROM');
     insert into tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
       values (:new.fk_id, addr.fc_country||' '||addr.fc_region||' '||addr.fc_town, get_synid('EPID_PRYB_FROM'),get_synid('EPID_PRYB_FROM'));
   end loop;
END;
/
SHOW ERRORS;


