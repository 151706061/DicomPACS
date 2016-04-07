DROP TABLE ASU.TCOMPANY_S CASCADE CONSTRAINTS
/

--
-- TCOMPANY_S  (Table) 
--
CREATE TABLE ASU.TCOMPANY_S
(
  FK_ID            NUMBER(15),
  FC_NAME          VARCHAR2(100 BYTE),
  FC_SHORT         VARCHAR2(255 BYTE),
  FK_COUNTRYID     NUMBER(15),
  FK_REGIONID      NUMBER(15),
  FK_TOWNID        NUMBER(15),
  FC_ADR           VARCHAR2(90 BYTE),
  FC_FAX           VARCHAR2(30 BYTE),
  FC_TEL           VARCHAR2(30 BYTE),
  OLDID            NUMBER,
  FC_OKONH         VARCHAR2(30 BYTE),
  FC_OKPO          VARCHAR2(30 BYTE),
  FC_INN           VARCHAR2(30 BYTE),
  FK_INSURCOMPID   NUMBER,
  FK_OWNER         INTEGER,
  FC_SYNONIM       VARCHAR2(50 BYTE),
  FL_DEL           NUMBER,
  FK_GUID          VARCHAR2(32 BYTE),
  FN_TRANSFUS_NUM  VARCHAR2(20 BYTE),
  FD_EDITTIME      TIMESTAMP(6) WITH TIME ZONE,
  FK_COUNTRYIDG    RAW(16),
  FK_REGIONIDG     RAW(16),
  FK_TOWNIDG       RAW(16),
  FK_OWNERG        RAW(16),
  FK_INSURCOMPIDG  RAW(16),
  FL_ISTRANSFUS    NUMBER
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
-- TR_TCOMPANY_S  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY_S" 
    AFTER INSERT ON tcompany_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vtcountryfk_countryid number;
       vtregionfk_regionid number;
       vttownfk_townid number;
       vtcompanyfk_owner number;
       vtcompanyfk_insurcompid number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    vStr := :new.fk_guid;
    select max(t.fk_id)
    into vID 
    from asu.tcompany t where t.fk_guid = :new.fk_guid;

    select fk_id into vID from asu.tcompany 
    where fc_synonim = 'ROOT_LPU'
    connect by prior fk_owner = fk_id
    start with fk_id = vID;
       
    if vID is not null then   
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tcompany t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vtcountryfk_countryid from asu.tcountry t where t.fk_guid = :new.fk_countryidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtregionfk_regionid from asu.tregion t where t.fk_guid = :new.fk_regionidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vttownfk_townid from asu.ttown t where t.fk_guid = :new.fk_townidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_owner from asu.tcompany t where t.fk_guid = :new.fk_ownerg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_insurcompid from asu.tcompany t where t.fk_guid = :new.fk_insurcompidg;
         exception when others then null;
         end;
        
      update tcompany set FL_ISTRANSFUS = :new.FL_ISTRANSFUS,
      FK_GUID = :new.FK_GUID,FN_TRANSFUS_NUM = :new.FN_TRANSFUS_NUM,FC_NAME = :new.FC_NAME,FC_SHORT = :new.FC_SHORT,FC_ADR = :new.FC_ADR,FC_FAX = :new.FC_FAX,FC_TEL = :new.FC_TEL,OLDID = :new.OLDID,FC_OKONH = :new.FC_OKONH,FC_OKPO = :new.FC_OKPO,FC_INN = :new.FC_INN,FC_SYNONIM = :new.FC_SYNONIM,FL_DEL = :new.FL_DEL,fk_countryid = vtcountryfk_countryid,fk_regionid = vtregionfk_regionid,fk_townid = vttownfk_townid,fk_owner = vtcompanyfk_owner,fk_insurcompid = vtcompanyfk_insurcompid
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vtcountryfk_countryid from asu.tcountry t where t.fk_guid = :new.fk_countryidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtregionfk_regionid from asu.tregion t where t.fk_guid = :new.fk_regionidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vttownfk_townid from asu.ttown t where t.fk_guid = :new.fk_townidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_owner from asu.tcompany t where t.fk_guid = :new.fk_ownerg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_insurcompid from asu.tcompany t where t.fk_guid = :new.fk_insurcompidg;
         exception when others then null;
         end;
        
        insert into tcompany(FK_ID,FL_ISTRANSFUS,FK_GUID,FN_TRANSFUS_NUM,FC_NAME,FC_SHORT,FC_ADR,FC_FAX,FC_TEL,OLDID,FC_OKONH,FC_OKPO,FC_INN,FC_SYNONIM,FL_DEL,fk_countryid,fk_regionid,fk_townid,fk_owner,fk_insurcompid)
             values (SEQ_TCOMPANY.nextval,:new.FL_ISTRANSFUS,:new.FK_GUID,:new.FN_TRANSFUS_NUM,:new.FC_NAME,:new.FC_SHORT,:new.FC_ADR,:new.FC_FAX,:new.FC_TEL,:new.OLDID,:new.FC_OKONH,:new.FC_OKPO,:new.FC_INN,:new.FC_SYNONIM,:new.FL_DEL,vtcountryfk_countryid,vtregionfk_regionid,vttownfk_townid,vtcompanyfk_owner,vtcompanyfk_insurcompid);
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


