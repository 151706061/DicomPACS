DROP TRIGGER ASU.VNAZ_UPDATE_RASPIS
/

--
-- VNAZ_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPACLST (Table)
--   GET_NAZCANCEL (Function)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--   VNAZ_A_UPDT (Trigger)
--
CREATE OR REPLACE TRIGGER ASU.VNAZ_UPDATE_RASPIS
 AFTER 
 UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW FOLLOWS VNAZ_A_UPDT
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


