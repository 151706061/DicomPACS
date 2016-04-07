DROP TABLE ASU.TAMBULANCE_S CASCADE CONSTRAINTS
/

--
-- TAMBULANCE_S  (Table) 
--
CREATE TABLE ASU.TAMBULANCE_S
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FK_IBID      NUMBER(6),
  FK_IBY       NUMBER(4),
  FC_FAM       VARCHAR2(30 BYTE),
  FC_IM        VARCHAR2(30 BYTE),
  FC_OTCH      VARCHAR2(30 BYTE),
  FC_RABOTA    VARCHAR2(255 BYTE),
  FD_ROJD      DATE,
  FP_SEX       NUMBER(1),
  FC_ADR       VARCHAR2(200 BYTE),
  FL_VOV       NUMBER(1),
  FL_IVOV      NUMBER(1),
  FL_ULA       NUMBER(1),
  FL_PMC       NUMBER(15),
  FK_GROUPID   NUMBER(15),
  FC_PUT       VARCHAR2(10 BYTE),
  FK_PRIZN     NUMBER(15),
  FL_VYB       VARCHAR2(1 BYTE),
  FC_PHONE     VARCHAR2(30 BYTE),
  FC_RECOM     VARCHAR2(60 BYTE),
  FL_POKAZ     NUMBER(1),
  FK_PEPLID    NUMBER(15),
  FK_DOCOBSL   INTEGER,
  FK_UCHID     NUMBER(15),
  FK_GUID      VARCHAR2(32 BYTE),
  FD_EDITTIME  TIMESTAMP(6) WITH TIME ZONE,
  FK_PEPLIDG   RAW(16),
  FK_DOCOBSLG  RAW(16)
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
-- TR_TAMBULANCE_S  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE_S (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TAMBULANCE_S" 
    AFTER INSERT ON TAMBULANCE_s FOR EACH ROW
DISABLE
declare
    vID  number;
    vStr varchar(2000);
     vTPEOPLESfk_peplid number;
       vtdocobslfk_docobsl number;
      
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from TAMBULANCE t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      begin
          select t.fk_id into vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_guid = :new.fk_peplidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_guid = :new.fk_docobslg;
         exception when others then null;
         end;
        
      update TAMBULANCE set FK_GUID = :new.FK_GUID,FK_IBID = :new.FK_IBID,FK_IBY = :new.FK_IBY,FC_FAM = :new.FC_FAM,FC_IM = :new.FC_IM,FC_OTCH = :new.FC_OTCH,FC_RABOTA = :new.FC_RABOTA,FD_ROJD = :new.FD_ROJD,FP_SEX = :new.FP_SEX,FC_ADR = :new.FC_ADR,FL_VOV = :new.FL_VOV,FL_IVOV = :new.FL_IVOV,FL_ULA = :new.FL_ULA,FL_PMC = :new.FL_PMC,FK_GROUPID = :new.FK_GROUPID,FC_PUT = :new.FC_PUT,FK_PRIZN = :new.FK_PRIZN,FL_VYB = :new.FL_VYB,FC_PHONE = :new.FC_PHONE,FC_RECOM = :new.FC_RECOM,FL_POKAZ = :new.FL_POKAZ,FK_UCHID = :new.FK_UCHID,fk_peplid = vTPEOPLESfk_peplid,fk_docobsl = vtdocobslfk_docobsl
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      begin
          select t.fk_id into vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_guid = :new.fk_peplidg;
         exception when others then null;
         end;
        begin
          select t.fk_id into vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_guid = :new.fk_docobslg;
         exception when others then null;
         end;
        
        insert into TAMBULANCE(FK_ID,FK_GUID,FK_IBID,FK_IBY,FC_FAM,FC_IM,FC_OTCH,FC_RABOTA,FD_ROJD,FP_SEX,FC_ADR,FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_GROUPID,FC_PUT,FK_PRIZN,FL_VYB,FC_PHONE,FC_RECOM,FL_POKAZ,FK_UCHID,fk_peplid,fk_docobsl)
             values (SEQ_TKARTA.nextval,:new.FK_GUID,:new.FK_IBID,:new.FK_IBY,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FC_RABOTA,:new.FD_ROJD,:new.FP_SEX,:new.FC_ADR,:new.FL_VOV,:new.FL_IVOV,:new.FL_ULA,:new.FL_PMC,:new.FK_GROUPID,:new.FC_PUT,:new.FK_PRIZN,:new.FL_VYB,:new.FC_PHONE,:new.FC_RECOM,:new.FL_POKAZ,:new.FK_UCHID,vTPEOPLESfk_peplid,vtdocobslfk_docobsl);
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


