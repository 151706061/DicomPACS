DROP TABLE ASU.TVIDDOC_S CASCADE CONSTRAINTS
/

--
-- TVIDDOC_S  (Table) 
--
CREATE TABLE ASU.TVIDDOC_S
(
  FK_ID        NUMBER(16)                       NOT NULL,
  FC_NAME      VARCHAR2(30 BYTE),
  FN_ORDER     NUMBER(2),
  FL_DEFAULT   NUMBER,
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
-- TR_TVIDDOC_S  (Trigger) 
--
--  Dependencies: 
--   TVIDDOC_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TVIDDOC_S" 
    AFTER INSERT ON TVIDDOC_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
    
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TVIDDOC t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      
      update TVIDDOC set FC_NAME = :new.FC_NAME,FN_ORDER = :new.FN_ORDER,FL_DEFAULT = :new.FL_DEFAULT,FK_GUID = :new.FK_GUID
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      
        insert into TVIDDOC(FK_ID,FC_NAME,FN_ORDER,FL_DEFAULT,FK_GUID)
             values (SEQ_TVIDDOCS.nextval,:new.FC_NAME,:new.FN_ORDER,:new.FL_DEFAULT,:new.FK_GUID);
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


