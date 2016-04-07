DROP TRIGGER ASU.TR_TDOCOBSL
/

--
-- TR_TDOCOBSL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TCOMPANY (Table)
--   TDOCOBSL (Table)
--   TDOCOBSL_S (Table)
--   SEQ_SYNC_LOG (Sequence)
--   PKG_SYNC (Package)
--   TUSLVID (Table)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TDOCOBSL" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TDOCOBSL FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTUSLVIDfk_viddocid varchar(32);
     vTCOMPANYfk_lpu varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
     begin
       select s.fk_id into vID from  
                           (select fk_id from TUSLVID t
                             start with t.fk_id = 481
                           connect by prior t.fk_id = t.fk_ownerid) s
                       where nvl(:new.fk_viddocid,:old.fk_viddocid)=s.fk_id;
     exception when others then vID := null;
     end;
     if vID is not null then     
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_id = :new.fk_viddocid;
         exception when others then
           vTUSLVIDfk_viddocid := null;
         end;
        begin
          select t.fk_guid into  vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_id = :new.fk_lpu;
         exception when others then
           vTCOMPANYfk_lpu := null;
         end;
       
         insert into TDOCOBSL_s (FK_ID,FK_NUMIB,FN_YEAR,FK_GUID,fk_viddocidg,fk_lpug,fd_edittime)
              values (0,:new.FK_NUMIB,:new.FN_YEAR,:new.FK_GUID,vTUSLVIDfk_viddocid,vTCOMPANYfk_lpu,systimestamp);
       elsif DELETING then
         insert into TDOCOBSL_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_id = :new.fk_viddocid;
         exception when others then
           vTUSLVIDfk_viddocid := null;
         end;
        begin
          select t.fk_guid into  vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_id = :new.fk_lpu;
         exception when others then
           vTCOMPANYfk_lpu := null;
         end;
       
         insert into TDOCOBSL_s (FK_ID,FK_NUMIB,FN_YEAR,FK_GUID,fk_viddocidg,fk_lpug,fd_edittime)
              values (2,:new.FK_NUMIB,:new.FN_YEAR,:new.FK_GUID,vTUSLVIDfk_viddocid,vTCOMPANYfk_lpu,systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
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


