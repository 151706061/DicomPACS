DROP TRIGGER ASU.TR_TFUS_MATERIAL
/

--
-- TR_TFUS_MATERIAL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TFUS_MATERIAL (Table)
--   TFUS_MATERIAL_S (Table)
--   SEQ_SYNC_LOG (Sequence)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_MATERIAL" 
     AFTER INSERT OR UPDATE OR DELETE ON tfus_material FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vTFUS_MATERIALFK_OWNER varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
           vTFUS_MATERIALFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER,'TFUS_MATERIAL');
         exception when others then
           vTFUS_MATERIALFK_OWNER := null;
         end;
       
         insert into tfus_material_s (FK_ID,FK_GUID,FC_REGIM_HRAN,FC_REGIM_TRANSPORT,FC_INSTRUCTION_ISPOL,FC_NUMBER,FC_NAME,FC_SYNONIM,FK_EDIZM,FK_DOPEDIZM,FN_DAYSDEFGODEN,FL_NEEDKARANTIN,FK_OWNERg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_REGIM_HRAN,:new.FC_REGIM_TRANSPORT,:new.FC_INSTRUCTION_ISPOL,:new.FC_NUMBER,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_EDIZM,:new.FK_DOPEDIZM,:new.FN_DAYSDEFGODEN,:new.FL_NEEDKARANTIN,vTFUS_MATERIALFK_OWNER,systimestamp);
       elsif DELETING then
         insert into tfus_material_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
           vTFUS_MATERIALFK_OWNER := pkg_sync.GetGuidByID(:new.FK_OWNER,'TFUS_MATERIAL');
         exception when others then
           vTFUS_MATERIALFK_OWNER := null;
         end;
       
         insert into tfus_material_s (FK_ID,FK_GUID,FC_REGIM_HRAN,FC_REGIM_TRANSPORT,FC_INSTRUCTION_ISPOL,FC_NUMBER,FC_NAME,FC_SYNONIM,FK_EDIZM,FK_DOPEDIZM,FN_DAYSDEFGODEN,FL_NEEDKARANTIN,FK_OWNERg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_REGIM_HRAN,:new.FC_REGIM_TRANSPORT,:new.FC_INSTRUCTION_ISPOL,:new.FC_NUMBER,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_EDIZM,:new.FK_DOPEDIZM,:new.FN_DAYSDEFGODEN,:new.FL_NEEDKARANTIN,vTFUS_MATERIALFK_OWNER,systimestamp);
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


