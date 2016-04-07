DROP TRIGGER ASU.TR_TRESAN
/

--
-- TR_TRESAN  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TNAZAN (Table)
--   TRESAN (Table)
--   TRESAN_S (Table)
--   TPATNAME (Table)
--   TAMBULANCE (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TSMID (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--   TNAZSOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TRESAN" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TRESAN FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vTSMIDFK_BLOBID varchar(32);
       vTAMBULANCEFK_PACID varchar(32);
       vVNAZFK_NAZID varchar(32);
       vTPATNAMEFK_PATID varchar(32);
       vTNAZSOSFK_SOS varchar(32);
      
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
          select t.fk_guid into  vTSMIDFK_BLOBID from asu.TSMID t where t.fk_id = :new.FK_BLOBID;
         exception when others then
           vTSMIDFK_BLOBID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZID from asu.tnazan t where t.fk_id = :new.FK_NAZID;
         exception when others then
           vVNAZFK_NAZID := null;
         end;
        begin
          select t.fk_guid into  vTPATNAMEFK_PATID from asu.TPATNAME t where t.fk_id = :new.FK_PATID;
         exception when others then
           vTPATNAMEFK_PATID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_id = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into TRESAN_s (FK_ID,FK_GUID,FD_INS,FC_RES,FN_RES,FC_TYPE,FK_VRACHID,FK_PATNAME,FC_COMENT,FK_COLID,FL_ZAKL,FL_PATFIRST,FN_RES2,FK_BLOBID2,FK_BLOBID3,FK_SMIDg,FK_BLOBIDg,FK_PACIDg,FK_NAZIDg,FK_PATIDg,FK_SOSg,fd_edittime)
              values (0,:new.FK_GUID,:new.FD_INS,:new.FC_RES,:new.FN_RES,:new.FC_TYPE,:new.FK_VRACHID,:new.FK_PATNAME,:new.FC_COMENT,:new.FK_COLID,:new.FL_ZAKL,:new.FL_PATFIRST,:new.FN_RES2,:new.FK_BLOBID2,:new.FK_BLOBID3,vTSMIDFK_SMID,vTSMIDFK_BLOBID,vTAMBULANCEFK_PACID,vVNAZFK_NAZID,vTPATNAMEFK_PATID,vTNAZSOSFK_SOS,systimestamp);
       elsif DELETING then
         insert into TRESAN_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_BLOBID from asu.TSMID t where t.fk_id = :new.FK_BLOBID;
         exception when others then
           vTSMIDFK_BLOBID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZID from asu.tnazan t where t.fk_id = :new.FK_NAZID;
         exception when others then
           vVNAZFK_NAZID := null;
         end;
        begin
          select t.fk_guid into  vTPATNAMEFK_PATID from asu.TPATNAME t where t.fk_id = :new.FK_PATID;
         exception when others then
           vTPATNAMEFK_PATID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_id = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into TRESAN_s (FK_ID,FK_GUID,FD_INS,FC_RES,FN_RES,FC_TYPE,FK_VRACHID,FK_PATNAME,FC_COMENT,FK_COLID,FL_ZAKL,FL_PATFIRST,FN_RES2,FK_BLOBID2,FK_BLOBID3,FK_SMIDg,FK_BLOBIDg,FK_PACIDg,FK_NAZIDg,FK_PATIDg,FK_SOSg,fd_edittime)
              values (2,:new.FK_GUID,:new.FD_INS,:new.FC_RES,:new.FN_RES,:new.FC_TYPE,:new.FK_VRACHID,:new.FK_PATNAME,:new.FC_COMENT,:new.FK_COLID,:new.FL_ZAKL,:new.FL_PATFIRST,:new.FN_RES2,:new.FK_BLOBID2,:new.FK_BLOBID3,vTSMIDFK_SMID,vTSMIDFK_BLOBID,vTAMBULANCEFK_PACID,vVNAZFK_NAZID,vTPATNAMEFK_PATID,vTNAZSOSFK_SOS,systimestamp);
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


