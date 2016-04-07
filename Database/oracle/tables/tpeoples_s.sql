DROP TABLE ASU.TPEOPLES_S CASCADE CONSTRAINTS
/

--
-- TPEOPLES_S  (Table) 
--
CREATE TABLE ASU.TPEOPLES_S
(
  FK_ID          NUMBER(15),
  FC_FAM         VARCHAR2(30 BYTE),
  FC_IM          VARCHAR2(30 BYTE),
  FC_OTCH        VARCHAR2(30 BYTE),
  FP_SEX         NUMBER(1),
  FD_ROJD        DATE,
  FK_DOCVID      NUMBER(15),
  FC_DOCSER      VARCHAR2(10 BYTE),
  FC_DOCNUM      VARCHAR2(10 BYTE),
  FD_DOCDATE     DATE,
  FC_DOCVIDAN    VARCHAR2(100 BYTE),
  FC_RABOTA      VARCHAR2(255 BYTE),
  FC_PHONE       VARCHAR2(30 BYTE),
  FC_FAX         VARCHAR2(30 BYTE),
  FC_E_MAIL      VARCHAR2(40 BYTE),
  FC_HTTP        VARCHAR2(100 BYTE),
  FK_COMPANYID   NUMBER(15),
  FK_OTDEL       NUMBER(15),
  FK_DOLGNOST    NUMBER(15),
  FC_ROJDPLACE   VARCHAR2(200 BYTE),
  FK_GROUPID     NUMBER(15),
  FK_GUID        VARCHAR2(32 BYTE),
  FD_EDITTIME    TIMESTAMP(6) WITH TIME ZONE,
  FK_DOCVIDG     RAW(16),
  FK_COMPANYIDG  RAW(16),
  FK_OTDELG      RAW(16),
  FK_DOLGNOSTG   RAW(16)
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
-- TR_TPEOPLES_S  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TPEOPLES_S" 
    AFTER INSERT ON tpeoples_s FOR EACH ROW
declare
    vID  number;
    vStr varchar(2000);
     vTVIDDOCfk_docvid number;
       vtcompanyfk_companyid number;
       vtcompany_otdelfk_otdel number;
       vtcompany_dolgnostfk_dolgnost number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from tpeoples t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_guid = :new.fk_docvidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_companyid from asu.tcompany t where t.fk_guid = :new.fk_companyidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_guid = :new.fk_otdelg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_guid = :new.fk_dolgnostg;
         exception when others then null;
         end;
        
      update tpeoples set FK_GUID = :new.FK_GUID,FC_FAM = :new.FC_FAM,FC_IM = :new.FC_IM,FC_OTCH = :new.FC_OTCH,FP_SEX = :new.FP_SEX,FD_ROJD = :new.FD_ROJD,FC_DOCSER = :new.FC_DOCSER,FC_DOCNUM = :new.FC_DOCNUM,FD_DOCDATE = :new.FD_DOCDATE,FC_DOCVIDAN = :new.FC_DOCVIDAN,FC_RABOTA = :new.FC_RABOTA,FC_PHONE = :new.FC_PHONE,FC_FAX = :new.FC_FAX,FC_E_MAIL = :new.FC_E_MAIL,FC_HTTP = :new.FC_HTTP,FC_ROJDPLACE = :new.FC_ROJDPLACE,FK_GROUPID = :new.FK_GROUPID,fk_docvid = vTVIDDOCfk_docvid,fk_companyid = vtcompanyfk_companyid,fk_otdel = vtcompany_otdelfk_otdel,fk_dolgnost = vtcompany_dolgnostfk_dolgnost
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_guid = :new.fk_docvidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompanyfk_companyid from asu.tcompany t where t.fk_guid = :new.fk_companyidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_guid = :new.fk_otdelg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_guid = :new.fk_dolgnostg;
         exception when others then null;
         end;
        
        insert into tpeoples(FK_ID,FK_GUID,FC_FAM,FC_IM,FC_OTCH,FP_SEX,FD_ROJD,FC_DOCSER,FC_DOCNUM,FD_DOCDATE,FC_DOCVIDAN,FC_RABOTA,FC_PHONE,FC_FAX,FC_E_MAIL,FC_HTTP,FC_ROJDPLACE,FK_GROUPID,fk_docvid,fk_companyid,fk_otdel,fk_dolgnost)
             values (SEQ_TKARTA.nextval,:new.FK_GUID,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FP_SEX,:new.FD_ROJD,:new.FC_DOCSER,:new.FC_DOCNUM,:new.FD_DOCDATE,:new.FC_DOCVIDAN,:new.FC_RABOTA,:new.FC_PHONE,:new.FC_FAX,:new.FC_E_MAIL,:new.FC_HTTP,:new.FC_ROJDPLACE,:new.FK_GROUPID,vTVIDDOCfk_docvid,vtcompanyfk_companyid,vtcompany_otdelfk_otdel,vtcompany_dolgnostfk_dolgnost);
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


