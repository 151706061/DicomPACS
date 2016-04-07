DROP TABLE ASU.TUSLVID_S CASCADE CONSTRAINTS
/

--
-- TUSLVID_S  (Table) 
--
CREATE TABLE ASU.TUSLVID_S
(
  FK_ID          NUMBER(9),
  FC_NAME        VARCHAR2(32 BYTE),
  FL_IB          NUMBER(2),
  FL_PUT         NUMBER(1),
  FL_PUTTYPE     NUMBER(1),
  FL_RASS        NUMBER(1),
  FL_DEFAULT     NUMBER(1),
  FL_STOL        NUMBER(1),
  FC_SHORT       VARCHAR2(10 BYTE),
  FK_DOCID       NUMBER,
  FK_BUHTYPEPUT  NUMBER,
  FK_OWNERID     INTEGER,
  FK_GUID        VARCHAR2(32 BYTE),
  FD_EDITTIME    TIMESTAMP(6) WITH TIME ZONE,
  FK_OWNERIDG    RAW(16)
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
-- TR_TUSLVID_S  (Trigger) 
--
--  Dependencies: 
--   TUSLVID_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TUSLVID_S" 
    AFTER INSERT ON TUSLVID_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vTUSLVIDfk_ownerid number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TUSLVID t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_guid = :new.fk_owneridg;
         exception when others then null;
         end;
        
      update TUSLVID set FC_NAME = :new.FC_NAME,FL_IB = :new.FL_IB,FL_PUT = :new.FL_PUT,FL_PUTTYPE = :new.FL_PUTTYPE,FL_RASS = :new.FL_RASS,FL_DEFAULT = :new.FL_DEFAULT,FL_STOL = :new.FL_STOL,FC_SHORT = :new.FC_SHORT,FK_DOCID = :new.FK_DOCID,FK_BUHTYPEPUT = :new.FK_BUHTYPEPUT,FK_GUID = :new.FK_GUID,fk_ownerid = vTUSLVIDfk_ownerid
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTUSLVIDfk_ownerid from asu.TUSLVID t where t.fk_guid = :new.fk_owneridg;
         exception when others then null;
         end;
        
        insert into TUSLVID(FK_ID,FC_NAME,FL_IB,FL_PUT,FL_PUTTYPE,FL_RASS,FL_DEFAULT,FL_STOL,FC_SHORT,FK_DOCID,FK_BUHTYPEPUT,FK_GUID,fk_ownerid)
             values (SEQ_TUSLVID.nextval,:new.FC_NAME,:new.FL_IB,:new.FL_PUT,:new.FL_PUTTYPE,:new.FL_RASS,:new.FL_DEFAULT,:new.FL_STOL,:new.FC_SHORT,:new.FK_DOCID,:new.FK_BUHTYPEPUT,:new.FK_GUID,vTUSLVIDfk_ownerid);
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


