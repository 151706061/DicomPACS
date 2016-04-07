DROP TABLE ASU.TDOCOBSL_S CASCADE CONSTRAINTS
/

--
-- TDOCOBSL_S  (Table) 
--
CREATE TABLE ASU.TDOCOBSL_S
(
  FK_ID         NUMBER                          NOT NULL,
  FK_VIDDOCID   NUMBER,
  FK_NUMIB      NUMBER(9),
  FN_YEAR       NUMBER(4),
  FK_LPU        NUMBER,
  FK_GUID       VARCHAR2(32 BYTE),
  FD_EDITTIME   TIMESTAMP(6) WITH TIME ZONE,
  FK_VIDDOCIDG  RAW(16),
  FK_LPUG       RAW(16)
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
-- TR_TDOCOBSL_S  (Trigger) 
--
--  Dependencies: 
--   TDOCOBSL_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TDOCOBSL_S" 
    AFTER INSERT ON TDOCOBSL_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vTUSLVIDfk_viddocid number;
     vTCOMPANYfk_lpu number;
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    select max(t.fk_id)
    into vID 
    from asu.TUSLVID t where t.fk_guid = :new.fk_viddocidg;
    select max(s.fk_id) into vID from  
                           (select fk_id from TUSLVID t
                             start with t.fk_id = 481
                           connect by prior t.fk_id = t.fk_ownerid) s
                       where vID=s.fk_id;
       
    if vID is not null then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TDOCOBSL t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_guid = :new.fk_viddocidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_guid = :new.fk_lpug;
         exception when others then null;
         end;
        
      update TDOCOBSL set FK_NUMIB = :new.FK_NUMIB,FN_YEAR = :new.FN_YEAR,FK_GUID = :new.FK_GUID,fk_viddocid = vTUSLVIDfk_viddocid,fk_lpu = vTCOMPANYfk_lpu
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTUSLVIDfk_viddocid from asu.TUSLVID t where t.fk_guid = :new.fk_viddocidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vTCOMPANYfk_lpu from asu.TCOMPANY t where t.fk_guid = :new.fk_lpug;
         exception when others then null;
         end;
        
        insert into TDOCOBSL(FK_ID,FK_NUMIB,FN_YEAR,FK_GUID,fk_viddocid,fk_lpu)
             values (SEQ_TDOCOBSL.nextval,:new.FK_NUMIB,:new.FN_YEAR,:new.FK_GUID,vTUSLVIDfk_viddocid,vTCOMPANYfk_lpu);
    end if;
    
    PKG_sync.v_is_repl := 0;
   end if;
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


