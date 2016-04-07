DROP TRIGGER ASU.TR_TAMBULANCE
/

--
-- TR_TAMBULANCE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TAMBULANCE (Table)
--   TAMBULANCE_S (Table)
--   TDOCOBSL (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TPEOPLES (Table)
--   PKG_SYNC (Package)
--   TSYNC_LOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TAMBULANCE" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TAMBULANCE FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTPEOPLESfk_peplid varchar(32);
       vtdocobslfk_docobsl varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_id = :new.fk_peplid;
         exception when others then
           vTPEOPLESfk_peplid := null;
         end;
        begin
          select t.fk_guid into  vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_id = :new.fk_docobsl;
         exception when others then
           vtdocobslfk_docobsl := null;
         end;
       
         insert into TAMBULANCE_s (FK_ID,FK_GUID,FK_IBID,FK_IBY,FC_FAM,FC_IM,FC_OTCH,FC_RABOTA,FD_ROJD,FP_SEX,FC_ADR,FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_GROUPID,FC_PUT,FK_PRIZN,FL_VYB,FC_PHONE,FC_RECOM,FL_POKAZ,FK_UCHID,fk_peplidg,fk_docobslg,fd_edittime)
              values (0,:new.FK_GUID,:new.FK_IBID,:new.FK_IBY,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FC_RABOTA,:new.FD_ROJD,:new.FP_SEX,:new.FC_ADR,:new.FL_VOV,:new.FL_IVOV,:new.FL_ULA,:new.FL_PMC,:new.FK_GROUPID,:new.FC_PUT,:new.FK_PRIZN,:new.FL_VYB,:new.FC_PHONE,:new.FC_RECOM,:new.FL_POKAZ,:new.FK_UCHID,vTPEOPLESfk_peplid,vtdocobslfk_docobsl,systimestamp);
       elsif DELETING then
         insert into TAMBULANCE_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_id = :new.fk_peplid;
         exception when others then
           vTPEOPLESfk_peplid := null;
         end;
        begin
          select t.fk_guid into  vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_id = :new.fk_docobsl;
         exception when others then
           vtdocobslfk_docobsl := null;
         end;
       
         insert into TAMBULANCE_s (FK_ID,FK_GUID,FK_IBID,FK_IBY,FC_FAM,FC_IM,FC_OTCH,FC_RABOTA,FD_ROJD,FP_SEX,FC_ADR,FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_GROUPID,FC_PUT,FK_PRIZN,FL_VYB,FC_PHONE,FC_RECOM,FL_POKAZ,FK_UCHID,fk_peplidg,fk_docobslg,fd_edittime)
              values (2,:new.FK_GUID,:new.FK_IBID,:new.FK_IBY,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FC_RABOTA,:new.FD_ROJD,:new.FP_SEX,:new.FC_ADR,:new.FL_VOV,:new.FL_IVOV,:new.FL_ULA,:new.FL_PMC,:new.FK_GROUPID,:new.FC_PUT,:new.FK_PRIZN,:new.FL_VYB,:new.FC_PHONE,:new.FC_RECOM,:new.FL_POKAZ,:new.FK_UCHID,vTPEOPLESfk_peplid,vtdocobslfk_docobsl,systimestamp);
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


