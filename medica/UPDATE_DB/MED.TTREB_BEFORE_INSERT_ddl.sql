-- Start of DDL Script for Trigger MED.TTREB_BEFORE_INSERT
-- Generated 4-дек-2008 18:05:12 from MED@ASU

CREATE OR REPLACE TRIGGER med.ttreb_before_insert
 BEFORE
  INSERT
 ON med.ttreb
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN 
  IF :NEW.FK_ID IS NULL THEN
    SELECT SEQ_TTREB.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  
-- требования и без этого нормально фильтруются по группам МО
--  IF MED.PKG_MEDSES.get_isusesklad = 1 then
--    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
--  end if;
END TTREB_BEFORE_INSERT;
/


-- End of DDL Script for Trigger MED.TTREB_BEFORE_INSERT

