DROP TRIGGER ASU.VRES_UPDATE_RASPIS
/

--
-- VRES_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPACLST (Table)
--   VRES (Table)
--   GET_NAZCANCEL (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE TRIGGER ASU."VRES_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.VRES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_SOS = asu.get_vipnaz) or (:new.FK_SOS = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


