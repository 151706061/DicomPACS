DROP TRIGGER ASU.TNAZIS_UPDATE
/

--
-- TNAZIS_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZGROUP (Table)
--   TNAZIS (Table)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
begin
  if insnaz.bins then
--  asu.do_log_err('вылетело');
    return;
  end if;
  insnaz.bins:=true;
      UPDATE vnaz
         SET fk_smid = :new.fk_smid,fc_remark = :new.fc_remark,fd_naz = :new.fd_naz,fd_run = :new.fd_run,fk_roomid = :new.fk_roomid,
             fk_ispolid = :new.fk_ispolid,fk_vrachid = :new.fk_vrachid,fk_nazsosid = :new.fk_nazsosid,fk_pacid = :new.fk_pacid,
             fk_resultid = :new.fk_resultid,fc_name = :new.fc_name,fl_plat = :new.fl_plat,fc_type = :new.fc_type,
             fl_in_raspis = :new.fl_in_raspis,fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put,
             FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
       WHERE fk_id = :old.fk_id;

        UPDATE TNAZGROUP
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, FD_DATE =:NEW.FD_RUN
       WHERE FK_NAZID = :old.fk_id;
       IF (:OLD.FK_NAZSOSID = :NEW.FK_NAZSOSID) AND (:OLD.FD_RUN <> :NEW.FD_RUN) AND (:OLD.FK_NAZSOSID <> ASU.GET_VIPNAZ)  THEN
          UPDATE TNAZGROUP
          SET FD_RUN = :NEW.FD_RUN
          WHERE FK_NAZID = :OLD.FK_ID;
       END IF;


  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise;
end;
    END;
  END IF;
END;
/
SHOW ERRORS;


