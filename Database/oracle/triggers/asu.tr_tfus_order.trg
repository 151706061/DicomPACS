DROP TRIGGER ASU.TR_TFUS_ORDER
/

--
-- TR_TFUS_ORDER  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TLPU_OTDEL (Table)
--   TFUS_MATERIAL (Table)
--   TFUS_ORDER (Table)
--   TFUS_ORDER_S (Table)
--   TFUS_SMID (Table)
--   TFUS_SMIDLPU (Table)
--   SEQ_SYNC_LOG (Sequence)
--   TPEOPLES (Table)
--   PKG_SYNC (Package)
--   GET_CURRENT_LPU (Function)
--   TSYNC_LOG (Table)
--   TNAZSOS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_ORDER" 
     AFTER INSERT OR UPDATE OR DELETE ON tfus_order FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vTLPU_OTDELFK_FROMLPUOTD varchar(32);
       vTLPU_OTDELFK_TOLPUOTD varchar(32);
       vTFUS_MATERIALFK_MATERIAL varchar(32);
       vTPEOPLESFK_PACID varchar(32);
       vTSMIDFK_REZUS varchar(32);
       vTSMIDFK_BLOODGR varchar(32);
       vTNAZSOSFK_SOS varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTLPU_OTDELFK_FROMLPUOTD from login.TLPU_OTDEL t where t.FK_ID = :new.FK_FROMLPUOTD;
         exception when others then
           vTLPU_OTDELFK_FROMLPUOTD := null;
         end;
        begin
          select t.fk_guid into  vTLPU_OTDELFK_TOLPUOTD from login.TLPU_OTDEL t where t.FK_ID = :new.FK_TOLPUOTD;
         exception when others then
           vTLPU_OTDELFK_TOLPUOTD := null;
         end;
        begin
          select t.fk_guid into  vTFUS_MATERIALFK_MATERIAL from asu.TFUS_MATERIAL t where t.FK_ID = :new.FK_MATERIAL;
         exception when others then
           vTFUS_MATERIALFK_MATERIAL := null;
         end;
        begin
          select t.fk_guid into  vTPEOPLESFK_PACID from asu.TPEOPLES t where t.FK_ID = :new.FK_PACID;
         exception when others then
           vTPEOPLESFK_PACID := null;
         end;
        begin
           if :new.FK_REZUS is not null then
             select t.fk_guid into  vTSMIDFK_REZUS
               from asu.tfus_smid t, tfus_smidlpu l
              where t.fk_id = l.fk_fussmid and l.fk_smid = :new.FK_REZUS and asu.get_current_lpu()=l.fk_lpu;
           end if;
         exception when others then
           return;
         end;
        begin
           if :new.FK_BLOODGR is not null then
             select t.fk_guid into  vTSMIDFK_BLOODGR
               from asu.tfus_smid t, tfus_smidlpu l
              where t.fk_id = l.fk_fussmid and l.fk_smid = :new.FK_BLOODGR and asu.get_current_lpu()=l.fk_lpu;
           end if;
         exception when others then
           return;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.FK_ID = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into tfus_order_s (FK_ID,FN_AMOUNT,FC_DIAG_REC,FD_DATE,FD_RUN,FK_RES,FL_INDIVID,FD_ONDATE,FC_COMMENT,OLDID,FK_GUID,FK_FROMLPUOTDg,FK_TOLPUOTDg,FK_MATERIALg,FK_PACIDg,FK_REZUSg,FK_BLOODGRg,FK_SOSg,fd_edittime,fk_ibid,fk_iby)
              values (0,:new.FN_AMOUNT,:new.FC_DIAG_REC,:new.FD_DATE,:new.FD_RUN,:new.FK_RES,:new.FL_INDIVID,:new.FD_ONDATE,:new.FC_COMMENT,:new.OLDID,:new.FK_GUID,vTLPU_OTDELFK_FROMLPUOTD,vTLPU_OTDELFK_TOLPUOTD,vTFUS_MATERIALFK_MATERIAL,vTPEOPLESFK_PACID,vTSMIDFK_REZUS,vTSMIDFK_BLOODGR,vTNAZSOSFK_SOS,systimestamp,:new.fk_ibid,:new.fk_iby);
       elsif DELETING then
         insert into tfus_order_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTLPU_OTDELFK_FROMLPUOTD from login.TLPU_OTDEL t where t.FK_ID = :new.FK_FROMLPUOTD;
         exception when others then
           vTLPU_OTDELFK_FROMLPUOTD := null;
         end;
        begin
          select t.fk_guid into  vTLPU_OTDELFK_TOLPUOTD from login.TLPU_OTDEL t where t.FK_ID = :new.FK_TOLPUOTD;
         exception when others then
           vTLPU_OTDELFK_TOLPUOTD := null;
         end;
        begin
          select t.fk_guid into  vTFUS_MATERIALFK_MATERIAL from asu.TFUS_MATERIAL t where t.FK_ID = :new.FK_MATERIAL;
         exception when others then
           vTFUS_MATERIALFK_MATERIAL := null;
         end;
        begin
          select t.fk_guid into  vTPEOPLESFK_PACID from asu.TPEOPLES t where t.FK_ID = :new.FK_PACID;
         exception when others then
           vTPEOPLESFK_PACID := null;
         end;
        begin
         if  :new.FK_REZUS is not null then
          select t.fk_guid into  vTSMIDFK_REZUS
             from asu.tfus_smid t, tfus_smidlpu l
            where t.fk_id = l.fk_fussmid and l.fk_smid = :new.FK_REZUS and asu.get_current_lpu()=l.fk_lpu;
         end if;
         exception when others then
           return;
         end;
        begin
         if  :new.FK_BLOODGR is not null then
          select t.fk_guid into  vTSMIDFK_BLOODGR
             from asu.tfus_smid t, tfus_smidlpu l
            where t.fk_id = l.fk_fussmid and l.fk_smid = :new.FK_BLOODGR and asu.get_current_lpu()=l.fk_lpu;
         end if;
         exception when others then
           null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.FK_ID = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into tfus_order_s (FK_ID,FN_AMOUNT,FC_DIAG_REC,FD_DATE,FD_RUN,FK_RES,FL_INDIVID,FD_ONDATE,FC_COMMENT,OLDID,FK_GUID,FK_FROMLPUOTDg,FK_TOLPUOTDg,FK_MATERIALg,FK_PACIDg,FK_REZUSg,FK_BLOODGRg,FK_SOSg,fd_edittime,fk_ibid,fk_iby)
              values (2,:new.FN_AMOUNT,:new.FC_DIAG_REC,:new.FD_DATE,:new.FD_RUN,:new.FK_RES,:new.FL_INDIVID,:new.FD_ONDATE,:new.FC_COMMENT,:new.OLDID,:new.FK_GUID,vTLPU_OTDELFK_FROMLPUOTD,vTLPU_OTDELFK_TOLPUOTD,vTFUS_MATERIALFK_MATERIAL,vTPEOPLESFK_PACID,vTSMIDFK_REZUS,vTSMIDFK_BLOODGR,vTNAZSOSFK_SOS,systimestamp,:new.fk_ibid,:new.fk_iby);
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


