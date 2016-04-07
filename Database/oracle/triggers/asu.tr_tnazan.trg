DROP TRIGGER ASU.TR_TNAZAN
/

--
-- TR_TNAZAN  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TNAZAN (Table)
--   TNAZAN_S (Table)
--   TAMBULANCE (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TSMID (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--   TNAZSOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TNAZAN" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TNAZAN FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vTNAZSOSFK_NAZSOSID varchar(32);
       vTAMBULANCEFK_PACID varchar(32);
       vTSMIDFK_NAZTYPEID varchar(32);
       vVNAZFK_NAZOWNER varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_id = :new.FK_NAZSOSID;
         exception when others then
           vTNAZSOSFK_NAZSOSID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_id = :new.FK_NAZTYPEID;
         exception when others then
           vTSMIDFK_NAZTYPEID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_id = :new.FK_NAZOWNER;
         exception when others then
           vVNAZFK_NAZOWNER := null;
         end;
       
         insert into TNAZAN_s (FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMIDg,FK_NAZSOSIDg,FK_PACIDg,FK_NAZTYPEIDg,FK_NAZOWNERg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER,systimestamp);
       elsif DELETING then
         insert into TNAZAN_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_id = :new.FK_NAZSOSID;
         exception when others then
           vTNAZSOSFK_NAZSOSID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_id = :new.FK_NAZTYPEID;
         exception when others then
           vTSMIDFK_NAZTYPEID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_id = :new.FK_NAZOWNER;
         exception when others then
           vVNAZFK_NAZOWNER := null;
         end;
       
         insert into TNAZAN_s (FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMIDg,FK_NAZSOSIDg,FK_PACIDg,FK_NAZTYPEIDg,FK_NAZOWNERg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER,systimestamp);
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
   end;
/
SHOW ERRORS;


