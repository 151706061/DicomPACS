-- Start of DDL Script for Trigger MED.TMEDIC_INS
-- Generated 26.11.2008 11:00:58 from MED@ASU

CREATE OR REPLACE TRIGGER med.tmedic_ins
 BEFORE
  INSERT
 ON med.tmedic
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
   IF :NEW.medicid IS NULL THEN
      SELECT SEQ_TMEDIC.NEXTVAL
      INTO   :NEW.MEDICID
      FROM   DUAL;
   END IF;
   
   IF MED.PKG_MEDSES.get_isusesklad = 1 then
     :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
   end if;
END;
/


-- End of DDL Script for Trigger MED.TMEDIC_INS

