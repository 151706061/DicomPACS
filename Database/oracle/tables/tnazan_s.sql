DROP TABLE ASU.TNAZAN_S CASCADE CONSTRAINTS
/

--
-- TNAZAN_S  (Table) 
--
CREATE TABLE ASU.TNAZAN_S
(
  FK_ID           NUMBER(15)                    NOT NULL,
  FK_SMID         NUMBER(15),
  FC_REMARK       VARCHAR2(4000 BYTE),
  FD_NAZ          DATE,
  FD_RUN          DATE,
  FK_ROOMID       NUMBER(9),
  FK_ISPOLID      NUMBER(15),
  FK_VRACHID      NUMBER(15),
  FK_NAZSOSID     NUMBER(15),
  FK_PACID        NUMBER(15),
  FK_RESULTID     NUMBER(15),
  FC_NAME         VARCHAR2(100 BYTE),
  FL_PLAT         VARCHAR2(3 BYTE),
  FC_TYPE         VARCHAR2(20 BYTE),
  FL_INS          NUMBER(1),
  FL_IN_RASPIS    NUMBER(1),
  FK_RAZDID       NUMBER(9),
  FL_ISVRACHVIEW  NUMBER(1),
  FL_MORE_PUT     NUMBER(1),
  FK_DOCID        NUMBER(15),
  FK_NAZTYPEID    NUMBER(15),
  FK_NAZOWNER     NUMBER(15),
  FK_NAZCAUSEID   NUMBER,
  FK_GUID         VARCHAR2(32 BYTE),
  FD_EDITTIME     TIMESTAMP(6) WITH TIME ZONE,
  FK_SMIDG        RAW(16),
  FK_NAZSOSIDG    RAW(16),
  FK_PACIDG       RAW(16),
  FK_NAZTYPEIDG   RAW(16),
  FK_NAZOWNERG    RAW(16)
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
-- TR_TNAZAN_S  (Trigger) 
--
--  Dependencies: 
--   TNAZAN_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TNAZAN_S" 
    AFTER INSERT ON TNAZAN_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vTSMIDFK_SMID number;
       vTNAZSOSFK_NAZSOSID number;
       vTAMBULANCEFK_PACID number;
       vTSMIDFK_NAZTYPEID number;
       vVNAZFK_NAZOWNER number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TNAZAN t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_guid = :new.FK_NAZSOSIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_guid = :new.FK_NAZTYPEIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_guid = :new.FK_NAZOWNERg;
         exception when others then null;
         end;
        
      update TNAZAN set FK_GUID = :new.FK_GUID,FC_REMARK = :new.FC_REMARK,FD_NAZ = :new.FD_NAZ,FD_RUN = :new.FD_RUN,FK_ROOMID = :new.FK_ROOMID,FK_ISPOLID = :new.FK_ISPOLID,FK_VRACHID = :new.FK_VRACHID,FK_RESULTID = :new.FK_RESULTID,FC_NAME = :new.FC_NAME,FL_PLAT = :new.FL_PLAT,FC_TYPE = :new.FC_TYPE,FL_INS = :new.FL_INS,FL_IN_RASPIS = :new.FL_IN_RASPIS,FK_RAZDID = :new.FK_RAZDID,FL_ISVRACHVIEW = :new.FL_ISVRACHVIEW,FL_MORE_PUT = :new.FL_MORE_PUT,FK_DOCID = :new.FK_DOCID,FK_NAZCAUSEID = :new.FK_NAZCAUSEID,FK_SMID = vTSMIDFK_SMID,FK_NAZSOSID = vTNAZSOSFK_NAZSOSID,FK_PACID = vTAMBULANCEFK_PACID,FK_NAZTYPEID = vTSMIDFK_NAZTYPEID,FK_NAZOWNER = vVNAZFK_NAZOWNER
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTSMIDFK_SMID from asu.TSMID t where t.fk_guid = :new.FK_SMIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_guid = :new.FK_NAZSOSIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_guid = :new.FK_PACIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_guid = :new.FK_NAZTYPEIDg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_guid = :new.FK_NAZOWNERg;
         exception when others then null;
         end;
        
        insert into TNAZAN(FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMID,FK_NAZSOSID,FK_PACID,FK_NAZTYPEID,FK_NAZOWNER)
             values (seq_tkarta.nextval,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER);
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


