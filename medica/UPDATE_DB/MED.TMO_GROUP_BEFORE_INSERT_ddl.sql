-- Start of DDL Script for Trigger MED.TMO_GROUP_BEFORE_INSERT
-- Generated 05.12.2008 10:46:50 from MED@ASU

CREATE OR REPLACE TRIGGER med.tmo_group_before_insert
 BEFORE
  INSERT
 ON med.tmo_group
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  select SEQ_TMO_GROUP.nextval into :new.GROUPID from dual;
  
  IF MED.PKG_MEDSES.get_isusesklad = 1 then
    :NEW.FK_SKLAD_ID := MED.PKG_MEDSES.get_cur_mo_sklad_id;
  end if;
  
  -- вставляем новую группу МО в список разрешений
  insert into MED.TMEDICS_BY_UCHRG_MOGROUP (FK_UCHGR_ID, FK_MOGROUP_ID)
  select UCHGRID, :NEW.GROUPID  from med.tuchgr;
End;
/


-- End of DDL Script for Trigger MED.TMO_GROUP_BEFORE_INSERT

