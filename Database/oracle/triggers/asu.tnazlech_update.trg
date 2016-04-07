DROP TRIGGER ASU.TNAZLECH_UPDATE
/

--
-- TNAZLECH_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   TNAZLECH (Table)
--   GET_NEVIP (Function)
--   GET_VIPNAZ (Function)
--   INSNAZ (Package)
--   VNAZ (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_UPDATE" 
 BEFORE
  UPDATE
 ON tnazlech
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
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
             fl_in_raspis = :new.fl_in_raspis,fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put ,
             FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
       WHERE fk_id = :old.fk_id;
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


