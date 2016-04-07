DROP TABLE ASU.TFUS_MATERIAL_S CASCADE CONSTRAINTS
/

--
-- TFUS_MATERIAL_S  (Table) 
--
CREATE TABLE ASU.TFUS_MATERIAL_S
(
  FK_ID                 NUMBER,
  FC_NAME               VARCHAR2(250 BYTE),
  FC_SYNONIM            VARCHAR2(250 BYTE),
  FK_EDIZM              NUMBER,
  FK_DOPEDIZM           NUMBER,
  FK_OWNER              NUMBER,
  FN_DAYSDEFGODEN       NUMBER,
  FL_NEEDKARANTIN       NUMBER,
  FC_REGIM_HRAN         VARCHAR2(250 BYTE),
  FC_REGIM_TRANSPORT    VARCHAR2(250 BYTE),
  FC_INSTRUCTION_ISPOL  VARCHAR2(250 BYTE),
  FC_NUMBER             VARCHAR2(250 BYTE),
  FK_GUID               VARCHAR2(32 BYTE),
  FD_EDITTIME           TIMESTAMP(6) WITH TIME ZONE,
  FK_OWNERG             RAW(16)
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
-- TR_TFUS_MATERIAL_S  (Trigger) 
--
--  Dependencies: 
--   TFUS_MATERIAL_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_MATERIAL_S" 
    AFTER INSERT ON tfus_material_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vTFUS_MATERIALFK_OWNER number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tfus_material t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          vTFUS_MATERIALFK_OWNER := pkg_sync.GetIDByGuid(:new.FK_OWNERg,'TFUS_MATERIAL');
         exception when others then null;
         end;
        
      update tfus_material set FK_GUID = :new.FK_GUID,FC_REGIM_HRAN = :new.FC_REGIM_HRAN,FC_REGIM_TRANSPORT = :new.FC_REGIM_TRANSPORT,FC_INSTRUCTION_ISPOL = :new.FC_INSTRUCTION_ISPOL,FC_NUMBER = :new.FC_NUMBER,FC_NAME = :new.FC_NAME,FC_SYNONIM = :new.FC_SYNONIM,FK_EDIZM = :new.FK_EDIZM,FK_DOPEDIZM = :new.FK_DOPEDIZM,FN_DAYSDEFGODEN = :new.FN_DAYSDEFGODEN,FL_NEEDKARANTIN = :new.FL_NEEDKARANTIN,FK_OWNER = vTFUS_MATERIALFK_OWNER
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          vTFUS_MATERIALFK_OWNER := pkg_sync.GetIDByGuid(:new.FK_OWNERg,'TFUS_MATERIAL');
         exception when others then null;
         end;
        
        insert into tfus_material(FK_ID,FK_GUID,FC_REGIM_HRAN,FC_REGIM_TRANSPORT,FC_INSTRUCTION_ISPOL,FC_NUMBER,FC_NAME,FC_SYNONIM,FK_EDIZM,FK_DOPEDIZM,FN_DAYSDEFGODEN,FL_NEEDKARANTIN,FK_OWNER)
             values (SEQ_TFUS_MATERIAL.nextval,:new.FK_GUID,:new.FC_REGIM_HRAN,:new.FC_REGIM_TRANSPORT,:new.FC_INSTRUCTION_ISPOL,:new.FC_NUMBER,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_EDIZM,:new.FK_DOPEDIZM,:new.FN_DAYSDEFGODEN,:new.FL_NEEDKARANTIN,vTFUS_MATERIALFK_OWNER);
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


