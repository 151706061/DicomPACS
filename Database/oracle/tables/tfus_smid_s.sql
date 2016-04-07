DROP TABLE ASU.TFUS_SMID_S CASCADE CONSTRAINTS
/

--
-- TFUS_SMID_S  (Table) 
--
CREATE TABLE ASU.TFUS_SMID_S
(
  FK_ID        NUMBER,
  FC_NAME      VARCHAR2(250 BYTE),
  FC_SYNONIM   VARCHAR2(250 BYTE),
  FK_GUID      VARCHAR2(32 BYTE),
  FK_OWNER     NUMBER,
  FD_EDITTIME  TIMESTAMP(6) WITH TIME ZONE,
  FK_OWNERG    RAW(16)
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
-- TR_TFUS_SMID_S  (Trigger) 
--
--  Dependencies: 
--   TFUS_SMID_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TFUS_SMID_S" 
    AFTER INSERT ON tfus_smid_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vTSMIDFK_OWNER number;

  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tfus_smid t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          vTSMIDFK_OWNER := pkg_sync.GetIDByGuid(:new.FK_OWNERg, 'tfus_smid');
         exception when others then null;
         end;

      update tfus_smid set FC_NAME = :new.FC_NAME,FC_SYNONIM = :new.FC_SYNONIM,FK_GUID = :new.FK_GUID,FK_OWNER = vTSMIDFK_OWNER
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          vTSMIDFK_OWNER := pkg_sync.GetIDByGuid(:new.FK_OWNERg, 'tfus_smid');
         exception when others then null;
         end;

        insert into tfus_smid(FK_ID,FC_NAME,FC_SYNONIM,FK_GUID,FK_OWNER)
             values (SEQ_TFUS_SMID.nextval,:new.FC_NAME,:new.FC_SYNONIM,:new.FK_GUID,vTSMIDFK_OWNER);
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


