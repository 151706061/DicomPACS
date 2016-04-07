DROP TABLE ASU.TFUS_ORDER_S CASCADE CONSTRAINTS
/

--
-- TFUS_ORDER_S  (Table) 
--
CREATE TABLE ASU.TFUS_ORDER_S
(
  FK_ID           NUMBER,
  FK_FROMLPUOTD   NUMBER,
  FK_TOLPUOTD     NUMBER,
  FK_MATERIAL     NUMBER,
  FK_PACID        NUMBER,
  FN_AMOUNT       NUMBER,
  FK_REZUS        NUMBER,
  FK_BLOODGR      NUMBER,
  FC_DIAG_REC     VARCHAR2(4000 BYTE),
  FD_DATE         DATE,
  FD_RUN          DATE,
  FK_SOS          NUMBER,
  FK_RES          NUMBER,
  FL_INDIVID      NUMBER,
  FD_ONDATE       DATE,
  FC_COMMENT      VARCHAR2(4000 BYTE),
  OLDID           NUMBER,
  FK_GUID         VARCHAR2(32 BYTE),
  FD_EDITTIME     TIMESTAMP(6) WITH TIME ZONE,
  FK_FROMLPUOTDG  RAW(16),
  FK_TOLPUOTDG    RAW(16),
  FK_MATERIALG    RAW(16),
  FK_PACIDG       RAW(16),
  FK_REZUSG       RAW(16),
  FK_BLOODGRG     RAW(16),
  FK_SOSG         RAW(16),
  FK_IBID         NUMBER(9),
  FK_IBY          NUMBER(4)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TR_TFUS_ORDER_S  (Trigger) 
--
--  Dependencies: 
--   TFUS_ORDER_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_ORDER_S" 
    AFTER INSERT ON tfus_order_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vTLPU_OTDELFK_FROMLPUOTD number;
       vTLPU_OTDELFK_TOLPUOTD number;
       vTFUS_MATERIALFK_MATERIAL number;
       vTPEOPLESFK_PACID number;
       vTSMIDFK_REZUS number;
       vTSMIDFK_BLOODGR number;
       vTNAZSOSFK_SOS number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tfus_order t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.FK_ID into vTLPU_OTDELFK_FROMLPUOTD from login.TLPU_OTDEL t where t.fk_guid = :new.FK_FROMLPUOTDg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTLPU_OTDELFK_TOLPUOTD from login.TLPU_OTDEL t where t.fk_guid = :new.FK_TOLPUOTDg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTFUS_MATERIALFK_MATERIAL from asu.TFUS_MATERIAL t where t.fk_guid = :new.FK_MATERIALg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTPEOPLESFK_PACID from asu.TPEOPLES t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
         if  :new.FK_REZUSg is not null then
         select t.fk_smid into vTSMIDFK_REZUS from tfus_smidlpu t, tfus_smid s
           where s.fk_guid = :new.FK_REZUSg and s.fk_id=t.fk_fussmid and asu.get_current_lpu()=t.fk_lpu;
         end if;
         exception when others then return;
         end;
        begin
          if :new.FK_BLOODGRg is not null then
           select t.fk_smid into vTSMIDFK_BLOODGR from tfus_smidlpu t, tfus_smid s
            where s.fk_guid = :new.FK_BLOODGRg and s.fk_id=t.fk_fussmid and asu.get_current_lpu()=t.fk_lpu;
          end if;
         exception when others then return;
         end;
        begin
          select t.FK_ID into vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_guid = :new.FK_SOSg;
         exception when others then null;
         end;
        
      update tfus_order set FN_AMOUNT = :new.FN_AMOUNT,FC_DIAG_REC = :new.FC_DIAG_REC,FD_DATE = :new.FD_DATE,FD_RUN = :new.FD_RUN,FK_RES = :new.FK_RES,FL_INDIVID = :new.FL_INDIVID,FD_ONDATE = :new.FD_ONDATE,FC_COMMENT = :new.FC_COMMENT,OLDID = :new.OLDID,FK_GUID = :new.FK_GUID,FK_FROMLPUOTD = vTLPU_OTDELFK_FROMLPUOTD,FK_TOLPUOTD = vTLPU_OTDELFK_TOLPUOTD,FK_MATERIAL = vTFUS_MATERIALFK_MATERIAL,FK_PACID = vTPEOPLESFK_PACID,FK_REZUS = vTSMIDFK_REZUS,FK_BLOODGR = vTSMIDFK_BLOODGR,FK_SOS = vTNAZSOSFK_SOS,
      FK_IBID = :new.FK_IBID,FK_IBY = :new.FK_IBY
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.FK_ID into vTLPU_OTDELFK_FROMLPUOTD from login.TLPU_OTDEL t where t.fk_guid = :new.FK_FROMLPUOTDg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTLPU_OTDELFK_TOLPUOTD from login.TLPU_OTDEL t where t.fk_guid = :new.FK_TOLPUOTDg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTFUS_MATERIALFK_MATERIAL from asu.TFUS_MATERIAL t where t.fk_guid = :new.FK_MATERIALg;
         exception when others then null;
         end;
        begin
          select t.FK_ID into vTPEOPLESFK_PACID from asu.TPEOPLES t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
          if :new.FK_REZUSg is not null then
          select t.fk_smid into vTSMIDFK_REZUS from tfus_smidlpu t, tfus_smid s
           where s.fk_guid = :new.FK_REZUSg and s.fk_id=t.fk_fussmid and asu.get_current_lpu()=t.fk_lpu;
          end if;
         exception when others then return;
         end;
        begin
          if :new.FK_BLOODGRg is not null then
          select t.fk_smid into vTSMIDFK_BLOODGR from tfus_smidlpu t, tfus_smid s
           where s.fk_guid = :new.FK_BLOODGRg and s.fk_id=t.fk_fussmid and asu.get_current_lpu()=t.fk_lpu;
          end if;
         exception when others then return;
         end;
        begin
          select t.FK_ID into vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_guid = :new.FK_SOSg;
         exception when others then null;
         end;
        
        insert into tfus_order(FK_ID,FN_AMOUNT,FC_DIAG_REC,FD_DATE,FD_RUN,FK_RES,FL_INDIVID,FD_ONDATE,FC_COMMENT,OLDID,FK_GUID,FK_FROMLPUOTD,FK_TOLPUOTD,FK_MATERIAL,FK_PACID,FK_REZUS,FK_BLOODGR,FK_SOS,FK_IBID,FK_IBY)
             values (SEQ_TFUS_ORDER.nextval,:new.FN_AMOUNT,:new.FC_DIAG_REC,:new.FD_DATE,:new.FD_RUN,:new.FK_RES,:new.FL_INDIVID,:new.FD_ONDATE,:new.FC_COMMENT,:new.OLDID,:new.FK_GUID,vTLPU_OTDELFK_FROMLPUOTD,vTLPU_OTDELFK_TOLPUOTD,vTFUS_MATERIALFK_MATERIAL,vTPEOPLESFK_PACID,vTSMIDFK_REZUS,vTSMIDFK_BLOODGR,vTNAZSOSFK_SOS,:new.FK_IBID,:new.FK_IBY);
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


