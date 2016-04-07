DROP TRIGGER ASU.TNAZAN_UPDATE
/

--
-- TNAZAN_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TNAZAN (Table)
--   TNAZGROUP (Table)
--   GET_NEVIP (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_UPDATE" 
 BEFORE
 UPDATE
 ON ASU.TNAZAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if UPDATING ('FK_NAZSOSID') AND :old.FK_NAZSOSID <> :new.FK_NAZSOSID then
    UPDATE TPLAT_USLUG SET FP_SOS = :new.FK_NAZSOSID WHERE FK_NAZ = :new.fk_id;
    if :new.FK_NAZSOSID = GET_VIPNAZ then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 0, FL_AGREED = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
    if :new.FK_NAZSOSID = GET_NEVIP then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
  end if;

  if insnaz.bins then
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
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, fd_date = :new.fd_run

       WHERE FK_NAZID = :old.fk_id;
       if (:old.FK_NAZSOSID = :new.FK_NAZSOSID) and (:old.fd_run <> :new.fd_run) then
          UPDATE TNAZGROUP
          SET fd_run = :new.fd_run
          WHERE FK_NAZID = :old.fk_id;
       end if;
  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise_application_error(SQLCODE, SQLERRM);
end;
/
SHOW ERRORS;


