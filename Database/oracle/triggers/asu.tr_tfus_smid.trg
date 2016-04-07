DROP TRIGGER ASU.TR_TFUS_SMID
/

--
-- TR_TFUS_SMID  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TFUS_SMID (Table)
--   TFUS_SMID_S (Table)
--   SEQ_SYNC_LOG (Sequence)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_SMID" 
     AFTER INSERT OR UPDATE OR DELETE ON tfus_smid FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_OWNER varchar(32);

   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
           vTSMIDFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER, 'tfus_smid');
         exception when others then
           vTSMIDFK_OWNER := null;
         end;

         insert into tfus_smid_s (FK_ID,FC_NAME,FC_SYNONIM,FK_GUID,FK_OWNERg,fd_edittime)
              values (0,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_GUID,vTSMIDFK_OWNER,systimestamp);
       elsif DELETING then
         insert into tfus_smid_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
           vTSMIDFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER, 'tfus_smid');
         exception when others then
           vTSMIDFK_OWNER := null;
         end;

         insert into tfus_smid_s (FK_ID,FC_NAME,FC_SYNONIM,FK_GUID,FK_OWNERg,fd_edittime)
              values (2,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_GUID,vTSMIDFK_OWNER,systimestamp);
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


