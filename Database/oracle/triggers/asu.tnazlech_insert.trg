DROP TRIGGER ASU.TNAZLECH_INSERT
/

--
-- TNAZLECH_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZLECH (Table)
--   INSNAZ (Package)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_INSERT" 
 BEFORE
  INSERT
 ON tnazlech
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
BEGIN
 if insnaz.bins then
   return;
 end if;
  insnaz.bins:=true;
    SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


