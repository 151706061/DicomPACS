DROP TRIGGER ASU.TTECHBOLEZNI_AFTER_DEL
/

--
-- TTECHBOLEZNI_AFTER_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TIB (Table)
--   TSTOMPOS (Table)
--   TSTOMRES (Table)
--   TTECHBOLEZNI (Table)
--   TPICS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTECHBOLEZNI_AFTER_DEL" 
  AFTER DELETE ON ASU.TTECHBOLEZNI   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  delete from tib where fk_pacid = :old.fk_tibid;
  if :old.fk_stim is not null then --by TimurLan
    delete from tstompos where fk_picsid = :old.fk_stim;
    delete from tstomres where fk_stomnaz = :old.fk_stim;
  end if;
  delete from tpics where fk_nazid = :old.fk_id; --by TimurLan
End;
/
SHOW ERRORS;


