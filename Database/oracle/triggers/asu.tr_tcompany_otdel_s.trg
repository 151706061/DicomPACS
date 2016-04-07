DROP TRIGGER ASU.TR_TCOMPANY_OTDEL_S
/

--
-- TR_TCOMPANY_OTDEL_S  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TCOMPANY_OTDEL (Sequence)
--   TCOMPANY_OTDEL (Table)
--   TCOMPANY_OTDEL_S (Table)
--   SEQ_SYNC_LOG (Sequence)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY_OTDEL_S" 
    AFTER INSERT ON tcompany_otdel_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
    
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tcompany_otdel t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      
      update tcompany_otdel set FC_NAME = :new.FC_NAME,FK_GUID = :new.FK_GUID
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      
        insert into tcompany_otdel(FK_ID,FC_NAME,FK_GUID)
             values (SEQ_TCOMPANY_OTDEL.nextval,:new.FC_NAME,:new.FK_GUID);
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


