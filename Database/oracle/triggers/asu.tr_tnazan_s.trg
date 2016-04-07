DROP TRIGGER ASU.TR_TNAZAN_S
/

--
-- TR_TNAZAN_S  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TNAZAN (Table)
--   TNAZAN_S (Table)
--   TAMBULANCE (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TSMID (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--   TNAZSOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TNAZAN_S" 
    AFTER INSERT ON TNAZAN_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vTSMIDFK_SMID number;
       vTNAZSOSFK_NAZSOSID number;
       vTAMBULANCEFK_PACID number;
       vTSMIDFK_NAZTYPEID number;
       vVNAZFK_NAZOWNER number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TNAZAN t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_guid = :new.FK_NAZSOSIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_guid = :new.FK_NAZTYPEIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_guid = :new.FK_NAZOWNERg;
         exception when others then null;
         end;
        
      update TNAZAN set FK_GUID = :new.FK_GUID,FC_REMARK = :new.FC_REMARK,FD_NAZ = :new.FD_NAZ,FD_RUN = :new.FD_RUN,FK_ROOMID = :new.FK_ROOMID,FK_ISPOLID = :new.FK_ISPOLID,FK_VRACHID = :new.FK_VRACHID,FK_RESULTID = :new.FK_RESULTID,FC_NAME = :new.FC_NAME,FL_PLAT = :new.FL_PLAT,FC_TYPE = :new.FC_TYPE,FL_INS = :new.FL_INS,FL_IN_RASPIS = :new.FL_IN_RASPIS,FK_RAZDID = :new.FK_RAZDID,FL_ISVRACHVIEW = :new.FL_ISVRACHVIEW,FL_MORE_PUT = :new.FL_MORE_PUT,FK_DOCID = :new.FK_DOCID,FK_NAZCAUSEID = :new.FK_NAZCAUSEID,FK_SMID = vTSMIDFK_SMID,FK_NAZSOSID = vTNAZSOSFK_NAZSOSID,FK_PACID = vTAMBULANCEFK_PACID,FK_NAZTYPEID = vTSMIDFK_NAZTYPEID,FK_NAZOWNER = vVNAZFK_NAZOWNER
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_guid = :new.FK_NAZSOSIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_guid = :new.FK_NAZTYPEIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_guid = :new.FK_NAZOWNERg;
         exception when others then null;
         end;
        
        insert into TNAZAN(FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMID,FK_NAZSOSID,FK_PACID,FK_NAZTYPEID,FK_NAZOWNER)
             values (seq_tkarta.nextval,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER);
    end if;
    
    PKG_sync.v_is_repl := 0;
   end if;
exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
END;
/
SHOW ERRORS;


