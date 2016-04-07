DROP TRIGGER ASU.TNAZIS_INSERT
/

--
-- TNAZIS_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZGROUP (Table)
--   TNAZIS (Table)
--   PKG_NAZ (Package)
--   GET_GROUPID_BY_SMID (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    begin
      if :NEW.FK_ID is null then
        SELECT SEQ_TKARTA.NEXTVAL
          INTO :NEW.FK_ID
          FROM DUAL;
      end if;
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  SELECT SEQ_TKARTA.NEXTVAL
    INTO :NEW.FK_ID
    FROM DUAL;
  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
    INSERT INTO vnaz (fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
 else
    INSERT INTO vnaz (fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
    VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,:new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
 end if;
  insert into tnazgroup(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
    values(:new.FK_ID, GET_GROUPID_BY_SMID(:new.FK_SMID), :new.FD_RUN, :new.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :NEW.FD_RUN);

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
    end;
  END IF;
END;
/
SHOW ERRORS;


