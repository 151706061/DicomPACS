DROP TRIGGER ASU.TNAZAN_INSERT
/

--
-- TNAZAN_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   TNAZOPL (Table)
--   TSMID (Table)
--   PKG_NAZ (Package)
--   GET_GROUPID_BY_SMID (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--   TEXPAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_INSERT" 
 BEFORE
 INSERT
 ON ASU.TNAZAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
omsId NUMBER;
BEGIN
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/

 if insnaz.bins then
   return;
 end if;
  insnaz.bins:=true;
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

  for p in (SELECT FK_ID FK_SMID FROM TSMID WHERE FL_SHOWANAL <> 5 AND FC_TYPE <> 'COLUMNS' AND FL_DEL = 0 START WITH FK_OWNER = :NEW.FK_SMID CONNECT BY PRIOR FK_ID = FK_OWNER) loop
    INSERT INTO TEXPAN (FK_NAZID, FK_SMID) VALUES (:NEW.FK_ID, p.FK_SMID);
  end loop;-- << by TimurLan 05/10/06

  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview, pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  else
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview, :new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  end if;

  insert into tnazgroup(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
    values(:new.FK_ID, GET_GROUPID_BY_SMID(:new.FK_SMID), :new.FD_RUN, :new.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :new.FD_RUN);

  -- Reference from TNAZAN to TNAZOPL
  SELECT FK_ID into omsId FROM TSMID WHERE FC_SYNONIM = 'TAL_OPLOMS';
  INSERT INTO TNAZOPL (FK_NAZID, FK_SMID_TAL_OPL) VALUES (:new.FK_ID, omsId);

  insnaz.bins:=false;


  exception
    when others then
        insnaz.bins:=false;
END;
/
SHOW ERRORS;


