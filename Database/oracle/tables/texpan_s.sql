DROP TABLE ASU.TEXPAN_S CASCADE CONSTRAINTS
/

--
-- TEXPAN_S  (Table) 
--
CREATE TABLE ASU.TEXPAN_S
(
  FK_ID        NUMBER                           NOT NULL,
  FK_NAZID     NUMBER,
  FK_SMID      NUMBER,
  FK_GUID      VARCHAR2(32 BYTE),
  FD_EDITTIME  TIMESTAMP(6) WITH TIME ZONE,
  FK_SMIDG     RAW(16),
  FK_NAZIDG    RAW(16)
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
-- TR_TEXPAN_S  (Trigger) 
--
--  Dependencies: 
--   TEXPAN_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TEXPAN_S" 
    AFTER INSERT ON texpan_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vTSMIDFK_SMID number;
       vvnazfk_nazid number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from texpan t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vvnazfk_nazid from asu.TNAZAN t where t.fk_guid = :new.fk_nazidg;
         exception when others then null;
         end;
        
      update texpan set FK_GUID = :new.FK_GUID,FK_SMID = vTSMIDFK_SMID,fk_nazid = vvnazfk_nazid
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vvnazfk_nazid from asu.TNAZAN t where t.fk_guid = :new.fk_nazidg;
         exception when others then null;
         end;
        
        insert into texpan(FK_ID,FK_GUID,FK_SMID,fk_nazid)
             values (SEQ_TEXPAN.nextval,:new.FK_GUID,vTSMIDFK_SMID,vvnazfk_nazid);
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


