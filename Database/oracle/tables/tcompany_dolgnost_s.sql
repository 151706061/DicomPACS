DROP TABLE ASU.TCOMPANY_DOLGNOST_S CASCADE CONSTRAINTS
/

--
-- TCOMPANY_DOLGNOST_S  (Table) 
--
CREATE TABLE ASU.TCOMPANY_DOLGNOST_S
(
  FK_ID        NUMBER(15),
  FC_NAME      VARCHAR2(30 BYTE),
  FK_GUID      VARCHAR2(32 BYTE),
  FD_EDITTIME  TIMESTAMP(6) WITH TIME ZONE
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
-- TR_TCOMPANY_DOLGNOST_S  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY_DOLGNOST_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY_DOLGNOST_S" 
    AFTER INSERT ON tcompany_dolgnost_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
    
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tcompany_dolgnost t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      
      update tcompany_dolgnost set FK_GUID = :new.FK_GUID,FC_NAME = :new.FC_NAME
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      
        insert into tcompany_dolgnost(FK_ID,FK_GUID,FC_NAME)
             values (SEQ_TCOMPANY_DOLGNOST.nextval,:new.FK_GUID,:new.FC_NAME);
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


