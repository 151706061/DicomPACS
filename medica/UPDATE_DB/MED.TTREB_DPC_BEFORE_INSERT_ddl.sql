-- Start of DDL Script for Trigger MED.TTREB_DPC_BEFORE_INSERT
-- Generated 30.05.08 14:49:40 from MED@ASU

CREATE OR REPLACE TRIGGER MED.TTREB_DPC_BEFORE_INSERT
 BEFORE 
 INSERT
 ON MED.TTREB_DPC
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN 
  IF :NEW.FK_ID IS NULL THEN
    SELECT SEQ_TTREB_DPC.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;

  update asu.tnazmedlech nml set nml.FK_TREB_DPC = :NEW.FK_ID where nml.FK_ID = :NEW.FK_NAZMEDLECH_ID;
  update asu.tnazmed nm
     set nm.FK_TREB = :NEW.FK_TREBID
  where nm.FK_ID in(select nml.fk_nazmedid  from asu.tnazmedlech nml where nml.FK_ID = :NEW.FK_NAZMEDLECH_ID);
END TTREB_DPC_BEFORE_INSERT;
/


-- End of DDL Script for Trigger MED.TTREB_DPC_BEFORE_INSERT

