DROP TRIGGER ASU.TNAZLECH_UPDATE_RASPIS
/

--
-- TNAZLECH_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZLECH (Table)
--   TPACLST (Table)
--   GET_NAZCANCEL (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TNAZLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


