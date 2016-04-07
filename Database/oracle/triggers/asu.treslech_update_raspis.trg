DROP TRIGGER ASU.TRESLECH_UPDATE_RASPIS
/

--
-- TRESLECH_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESLECH (Table)
--   TPACLST (Table)
--   GET_NAZCANCEL (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TRESLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_SOS = asu.get_vipnaz) or (:new.FK_SOS = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


