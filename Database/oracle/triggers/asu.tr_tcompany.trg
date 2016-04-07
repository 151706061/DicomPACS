DROP TRIGGER ASU.TR_TCOMPANY
/

--
-- TR_TCOMPANY  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TCOMPANY (Table)
--   TCOMPANY_S (Table)
--   TCOUNTRY (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TTOWN (Table)
--   TREGION (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY" 
     AFTER INSERT OR UPDATE OR DELETE ON tcompany FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vtcountryfk_countryid varchar(32);
       vtregionfk_regionid varchar(32);
       vttownfk_townid varchar(32);
       vtcompanyfk_owner varchar(32);
       vtcompanyfk_insurcompid varchar(32);
      
   begin
     if (PKG_sync.v_is_repl = 0) and pkg_sync.get_company(nvl(:new.fk_owner, :old.fk_owner)) then     
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vtcountryfk_countryid from asu.tcountry t where t.fk_id = :new.fk_countryid;
         exception when others then
           vtcountryfk_countryid := null;
         end;
        begin
          select t.fk_guid into  vtregionfk_regionid from asu.tregion t where t.fk_id = :new.fk_regionid;
         exception when others then
           vtregionfk_regionid := null;
         end;
        begin
          select t.fk_guid into  vttownfk_townid from asu.ttown t where t.fk_id = :new.fk_townid;
         exception when others then
           vttownfk_townid := null;
         end;
        begin
           vtcompanyfk_owner := pkg_sync.GetGuidByID(:new.FK_OWNER,'TCOMPANY');
         exception when others then
           vtcompanyfk_owner := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_insurcompid from asu.tcompany t where t.fk_id = :new.fk_insurcompid;
         exception when others then
           vtcompanyfk_insurcompid := null;
         end;
       
         insert into tcompany_s (FK_ID,FL_ISTRANSFUS,FK_GUID,FN_TRANSFUS_NUM,FC_NAME,FC_SHORT,FC_ADR,FC_FAX,FC_TEL,OLDID,FC_OKONH,FC_OKPO,FC_INN,FC_SYNONIM,FL_DEL,fk_countryidg,fk_regionidg,fk_townidg,fk_ownerg,fk_insurcompidg,fd_edittime)
              values (0,:new.FL_ISTRANSFUS,:new.FK_GUID,:new.FN_TRANSFUS_NUM,:new.FC_NAME,:new.FC_SHORT,:new.FC_ADR,:new.FC_FAX,:new.FC_TEL,:new.OLDID,:new.FC_OKONH,:new.FC_OKPO,:new.FC_INN,:new.FC_SYNONIM,:new.FL_DEL,vtcountryfk_countryid,vtregionfk_regionid,vttownfk_townid,vtcompanyfk_owner,vtcompanyfk_insurcompid,systimestamp);
       elsif DELETING then
         insert into tcompany_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vtcountryfk_countryid from asu.tcountry t where t.fk_id = :new.fk_countryid;
         exception when others then
           vtcountryfk_countryid := null;
         end;
        begin
          select t.fk_guid into  vtregionfk_regionid from asu.tregion t where t.fk_id = :new.fk_regionid;
         exception when others then
           vtregionfk_regionid := null;
         end;
        begin
          select t.fk_guid into  vttownfk_townid from asu.ttown t where t.fk_id = :new.fk_townid;
         exception when others then
           vttownfk_townid := null;
         end;
        begin
--          select t.fk_guid into  vtcompanyfk_owner from asu.tcompany t where t.fk_id = :new.fk_owner;
           vtcompanyfk_owner := pkg_sync.GetGuidByID(:new.FK_OWNER,'TCOMPANY');
         exception when others then
           vtcompanyfk_owner := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_insurcompid from asu.tcompany t where t.fk_id = :new.fk_insurcompid;
         exception when others then
           vtcompanyfk_insurcompid := null;
         end;
       
         insert into tcompany_s (FK_ID,FL_ISTRANSFUS,FK_GUID,FN_TRANSFUS_NUM,FC_NAME,FC_SHORT,FC_ADR,FC_FAX,FC_TEL,OLDID,FC_OKONH,FC_OKPO,FC_INN,FC_SYNONIM,FL_DEL,fk_countryidg,fk_regionidg,fk_townidg,fk_ownerg,fk_insurcompidg,fd_edittime)
              values (2,:new.FL_ISTRANSFUS,:new.FK_GUID,:new.FN_TRANSFUS_NUM,:new.FC_NAME,:new.FC_SHORT,:new.FC_ADR,:new.FC_FAX,:new.FC_TEL,:new.OLDID,:new.FC_OKONH,:new.FC_OKPO,:new.FC_INN,:new.FC_SYNONIM,:new.FL_DEL,vtcountryfk_countryid,vtregionfk_regionid,vttownfk_townid,vtcompanyfk_owner,vtcompanyfk_insurcompid,systimestamp);
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


