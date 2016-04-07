DROP TRIGGER ASU.TR_TPEOPLES
/

--
-- TR_TPEOPLES  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TVIDDOC (Table)
--   TCOMPANY (Table)
--   TCOMPANY_DOLGNOST (Table)
--   TCOMPANY_OTDEL (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TPEOPLES (Table)
--   TPEOPLES_S (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TPEOPLES" 
     AFTER INSERT OR UPDATE OR DELETE ON tpeoples FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vTVIDDOCfk_docvid varchar(32);
       vtcompanyfk_companyid varchar(32);
       vtcompany_otdelfk_otdel varchar(32);
       vtcompany_dolgnostfk_dolgnost varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_id = :new.fk_docvid;
         exception when others then
           vTVIDDOCfk_docvid := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_companyid from asu.tcompany t where t.fk_id = :new.fk_companyid;
         exception when others then
           vtcompanyfk_companyid := null;
         end;
        begin
          select t.fk_guid into  vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_id = :new.fk_otdel;
         exception when others then
           vtcompany_otdelfk_otdel := null;
         end;
        begin
          select t.fk_guid into  vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_id = :new.fk_dolgnost;
         exception when others then
           vtcompany_dolgnostfk_dolgnost := null;
         end;
       
         insert into tpeoples_s (FK_ID,FK_GUID,FC_FAM,FC_IM,FC_OTCH,FP_SEX,FD_ROJD,FC_DOCSER,FC_DOCNUM,FD_DOCDATE,FC_DOCVIDAN,FC_RABOTA,FC_PHONE,FC_FAX,FC_E_MAIL,FC_HTTP,FC_ROJDPLACE,FK_GROUPID,fk_docvidg,fk_companyidg,fk_otdelg,fk_dolgnostg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FP_SEX,:new.FD_ROJD,:new.FC_DOCSER,:new.FC_DOCNUM,:new.FD_DOCDATE,:new.FC_DOCVIDAN,:new.FC_RABOTA,:new.FC_PHONE,:new.FC_FAX,:new.FC_E_MAIL,:new.FC_HTTP,:new.FC_ROJDPLACE,:new.FK_GROUPID,vTVIDDOCfk_docvid,vtcompanyfk_companyid,vtcompany_otdelfk_otdel,vtcompany_dolgnostfk_dolgnost,systimestamp);
       elsif DELETING then
         insert into tpeoples_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_id = :new.fk_docvid;
         exception when others then
           vTVIDDOCfk_docvid := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_companyid from asu.tcompany t where t.fk_id = :new.fk_companyid;
         exception when others then
           vtcompanyfk_companyid := null;
         end;
        begin
          select t.fk_guid into  vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_id = :new.fk_otdel;
         exception when others then
           vtcompany_otdelfk_otdel := null;
         end;
        begin
          select t.fk_guid into  vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_id = :new.fk_dolgnost;
         exception when others then
           vtcompany_dolgnostfk_dolgnost := null;
         end;
       
         insert into tpeoples_s (FK_ID,FK_GUID,FC_FAM,FC_IM,FC_OTCH,FP_SEX,FD_ROJD,FC_DOCSER,FC_DOCNUM,FD_DOCDATE,FC_DOCVIDAN,FC_RABOTA,FC_PHONE,FC_FAX,FC_E_MAIL,FC_HTTP,FC_ROJDPLACE,FK_GROUPID,fk_docvidg,fk_companyidg,fk_otdelg,fk_dolgnostg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FP_SEX,:new.FD_ROJD,:new.FC_DOCSER,:new.FC_DOCNUM,:new.FD_DOCDATE,:new.FC_DOCVIDAN,:new.FC_RABOTA,:new.FC_PHONE,:new.FC_FAX,:new.FC_E_MAIL,:new.FC_HTTP,:new.FC_ROJDPLACE,:new.FK_GROUPID,vTVIDDOCfk_docvid,vtcompanyfk_companyid,vtcompany_otdelfk_otdel,vtcompany_dolgnostfk_dolgnost,systimestamp);
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


