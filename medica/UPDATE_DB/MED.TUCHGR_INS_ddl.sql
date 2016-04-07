-- Start of DDL Script for Trigger MED.TUCHGR_INS
-- Generated 05.12.2008 10:38:51 from MED@ASU

CREATE OR REPLACE TRIGGER med.tuchgr_ins
 BEFORE
  INSERT
 ON med.tuchgr
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN  
  IF :NEW.UCHGRID IS NULL OR :NEW.UCHGRID < 0 THEN
    SELECT SEQ_TUCHGR.NEXTVAL INTO :NEW.UCHGRID FROM DUAL;
  END IF;
  
  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;

  -- вставляем новую группу учетности в список разрешений
  insert into MED.TMEDICS_BY_UCHRG_MOGROUP (FK_UCHGR_ID, FK_MOGROUP_ID)
  select :NEW.UCHGRID, GROUPID  from med.tmo_group where FL_DEL = 0;
END;
/


-- End of DDL Script for Trigger MED.TUCHGR_INS

