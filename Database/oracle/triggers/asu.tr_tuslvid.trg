DROP TRIGGER ASU.TR_TUSLVID
/

--
-- TR_TUSLVID  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_SYNC_LOG (Sequence)
--   PKG_SYNC (Package)
--   TUSLVID (Table)
--   TUSLVID_S (Table)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TUSLVID" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TUSLVID FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTUSLVIDfk_ownerid varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_id = :new.fk_ownerid;
         exception when others then
           vTUSLVIDfk_ownerid := null;
         end;
       
         insert into TUSLVID_s (FK_ID,FC_NAME,FL_IB,FL_PUT,FL_PUTTYPE,FL_RASS,FL_DEFAULT,FL_STOL,FC_SHORT,FK_DOCID,FK_BUHTYPEPUT,FK_GUID,fk_owneridg,fd_edittime)
              values (0,:new.FC_NAME,:new.FL_IB,:new.FL_PUT,:new.FL_PUTTYPE,:new.FL_RASS,:new.FL_DEFAULT,:new.FL_STOL,:new.FC_SHORT,:new.FK_DOCID,:new.FK_BUHTYPEPUT,:new.FK_GUID,vTUSLVIDfk_ownerid,systimestamp);
       elsif DELETING then
         insert into TUSLVID_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_id = :new.fk_ownerid;
         exception when others then
           vTUSLVIDfk_ownerid := null;
         end;
       
         insert into TUSLVID_s (FK_ID,FC_NAME,FL_IB,FL_PUT,FL_PUTTYPE,FL_RASS,FL_DEFAULT,FL_STOL,FC_SHORT,FK_DOCID,FK_BUHTYPEPUT,FK_GUID,fk_owneridg,fd_edittime)
              values (2,:new.FC_NAME,:new.FL_IB,:new.FL_PUT,:new.FL_PUTTYPE,:new.FL_RASS,:new.FL_DEFAULT,:new.FL_STOL,:new.FC_SHORT,:new.FK_DOCID,:new.FK_BUHTYPEPUT,:new.FK_GUID,vTUSLVIDfk_ownerid,systimestamp);
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


