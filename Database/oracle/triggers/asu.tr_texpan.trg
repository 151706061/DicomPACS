DROP TRIGGER ASU.TR_TEXPAN
/

--
-- TR_TEXPAN  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TNAZAN (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TSMID (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--   TEXPAN (Table)
--   TEXPAN_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TEXPAN" 
     AFTER INSERT OR UPDATE OR DELETE ON texpan FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vvnazfk_nazid varchar(32);
      
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
          select t.fk_guid into  vvnazfk_nazid from asu.TNAZAN t where t.fk_id = :new.fk_nazid;
         exception when others then
           vvnazfk_nazid := null;
         end;
       
         insert into texpan_s (FK_ID,FK_GUID,FK_SMIDg,fk_nazidg,fd_edittime)
              values (0,:new.FK_GUID,vTSMIDFK_SMID,vvnazfk_nazid,systimestamp);
       elsif DELETING then
         insert into texpan_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vvnazfk_nazid from asu.TNAZAN t where t.fk_id = :new.fk_nazid;
         exception when others then
           vvnazfk_nazid := null;
         end;
       
         insert into texpan_s (FK_ID,FK_GUID,FK_SMIDg,fk_nazidg,fd_edittime)
              values (2,:new.FK_GUID,vTSMIDFK_SMID,vvnazfk_nazid,systimestamp);
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


