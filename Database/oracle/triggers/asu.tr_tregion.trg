DROP TRIGGER ASU.TR_TREGION
/

--
-- TR_TREGION  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_SYNC_LOG (Sequence)
--   TREGION (Table)
--   TREGION_S (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TREGION" 
     AFTER INSERT OR UPDATE OR DELETE ON tregion FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
    
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         
         insert into tregion_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
              values (0,:new.FC_NAME,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
       elsif DELETING then
         insert into tregion_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         
         insert into tregion_s (FK_ID,FC_NAME,FL_DEFAULT,FK_GUID,fd_edittime)
              values (2,:new.FC_NAME,:new.FL_DEFAULT,:new.FK_GUID,systimestamp);
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


