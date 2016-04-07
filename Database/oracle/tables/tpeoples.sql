DROP TABLE ASU.TPEOPLES CASCADE CONSTRAINTS
/

--
-- TPEOPLES  (Table) 
--
CREATE TABLE ASU.TPEOPLES
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FC_FAM        VARCHAR2(30 BYTE),
  FC_IM         VARCHAR2(30 BYTE),
  FC_OTCH       VARCHAR2(30 BYTE),
  FP_SEX        NUMBER(1)                       DEFAULT -1,
  FD_ROJD       DATE,
  FK_DOCVID     NUMBER(15)                      DEFAULT -1,
  FC_DOCSER     VARCHAR2(10 BYTE),
  FC_DOCNUM     VARCHAR2(20 BYTE),
  FD_DOCDATE    DATE,
  FC_DOCVIDAN   VARCHAR2(100 BYTE),
  FC_RABOTA     VARCHAR2(255 BYTE),
  FC_PHONE      VARCHAR2(30 BYTE),
  FC_FAX        VARCHAR2(30 BYTE),
  FC_E_MAIL     VARCHAR2(40 BYTE),
  FC_HTTP       VARCHAR2(100 BYTE),
  FK_COMPANYID  NUMBER(15)                      DEFAULT -1,
  FK_OTDEL      NUMBER(15)                      DEFAULT -1,
  FK_DOLGNOST   NUMBER(15)                      DEFAULT -1,
  FC_ROJDPLACE  VARCHAR2(200 BYTE),
  FK_GROUPID    NUMBER(15)                      DEFAULT -1,
  FK_GUID       VARCHAR2(32 BYTE)               DEFAULT sys_guid(),
  FC_SNILS      VARCHAR2(14 BYTE),
  FC_UNRZ       VARCHAR2(16 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          23488K
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

COMMENT ON TABLE ASU.TPEOPLES IS 'Справочник клиентов by TimurLan [developing complite] '
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_HTTP IS 'пага'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_COMPANYID IS 'Место работы'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_OTDEL IS 'Отдел (цех и т.п.) предприятия'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_DOLGNOST IS 'Занимаемая должность'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_ROJDPLACE IS 'Место рождения'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_GROUPID IS 'Группа отбора'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_UNRZ IS 'УНРЗ для льготников 7 нозологиям'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_FAM IS 'Фамилия'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_IM IS 'Имя'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_OTCH IS 'Отчество'
/

COMMENT ON COLUMN ASU.TPEOPLES.FP_SEX IS 'пол'
/

COMMENT ON COLUMN ASU.TPEOPLES.FD_ROJD IS 'дата рождения'
/

COMMENT ON COLUMN ASU.TPEOPLES.FK_DOCVID IS 'вид документа удостоверяющего личность'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_DOCSER IS 'серия документа'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_DOCNUM IS 'номер документа'
/

COMMENT ON COLUMN ASU.TPEOPLES.FD_DOCDATE IS 'дата выдачи документа'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_DOCVIDAN IS 'место выдачи документа'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_RABOTA IS 'место работы'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_PHONE IS 'телефон'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_FAX IS 'факс'
/

COMMENT ON COLUMN ASU.TPEOPLES.FC_E_MAIL IS 'мыло'
/


--
-- IDX_TPEOPLES_GUID  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.IDX_TPEOPLES_GUID ON ASU.TPEOPLES
(FK_GUID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_COMPANY  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_COMPANY ON ASU.TPEOPLES
(FK_COMPANYID, FK_OTDEL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          8M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_DOCUMENT  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_DOCUMENT ON ASU.TPEOPLES
(FK_DOCVID, FC_DOCSER, FC_DOCNUM, FD_DOCDATE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          7296K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_FAM  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_FAM ON ASU.TPEOPLES
(FC_FAM)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5888K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_FIOGR  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_FIOGR ON ASU.TPEOPLES
(SUBSTR("FC_FAM",1,3)||SUBSTR("FC_IM",1,1)||SUBSTR("FC_OTCH",1,1)||TO_CHAR("FD_ROJD",'YY'))
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_FIO_YO  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_FIO_YO ON ASU.TPEOPLES
(REPLACE("FC_FAM",'Ё','Е'), REPLACE("FC_IM",'Ё','Е'), REPLACE("FC_OTCH",'Ё','Е'))
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_GROUPID  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_GROUPID ON ASU.TPEOPLES
(FK_GROUPID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_ID  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE UNIQUE INDEX ASU.TPEOPLES_BY_ID ON ASU.TPEOPLES
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4992K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_ID_F_I_O_ROJD_SEX  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_ID_F_I_O_ROJD_SEX ON ASU.TPEOPLES
(FC_FAM, FC_IM, FC_OTCH, FD_ROJD, FP_SEX)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          17792K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_SEX  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_SEX ON ASU.TPEOPLES
(FK_ID, FP_SEX)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6272K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES_BY_SNILS  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES_BY_SNILS ON ASU.TPEOPLES
(SUBSTR("ASU"."GET_SNILS_3332"("FC_SNILS"),1,11))
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPEOPLES$FK_DOCVID  (Index) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE INDEX ASU.TPEOPLES$FK_DOCVID ON ASU.TPEOPLES
(FK_DOCVID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TR_TPEOPLES  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TPEOPLES" 
     AFTER INSERT OR UPDATE OR DELETE ON tpeoples FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vTVIDDOCfk_docvid varchar(32);
       vtcompanyfk_companyid varchar(32);
       vtcompany_otdelfk_otdel varchar(32);
       vtcompany_dolgnostfk_dolgnost varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_id = :new.fk_docvid;
         exception when others then
           vTVIDDOCfk_docvid := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_companyid from asu.tcompany t where t.fk_id = :new.fk_companyid;
         exception when others then
           vtcompanyfk_companyid := null;
         end;
        begin
          select t.fk_guid into  vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_id = :new.fk_otdel;
         exception when others then
           vtcompany_otdelfk_otdel := null;
         end;
        begin
          select t.fk_guid into  vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_id = :new.fk_dolgnost;
         exception when others then
           vtcompany_dolgnostfk_dolgnost := null;
         end;
       
         insert into tpeoples_s (FK_ID,FK_GUID,FC_FAM,FC_IM,FC_OTCH,FP_SEX,FD_ROJD,FC_DOCSER,FC_DOCNUM,FD_DOCDATE,FC_DOCVIDAN,FC_RABOTA,FC_PHONE,FC_FAX,FC_E_MAIL,FC_HTTP,FC_ROJDPLACE,FK_GROUPID,fk_docvidg,fk_companyidg,fk_otdelg,fk_dolgnostg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FP_SEX,:new.FD_ROJD,:new.FC_DOCSER,:new.FC_DOCNUM,:new.FD_DOCDATE,:new.FC_DOCVIDAN,:new.FC_RABOTA,:new.FC_PHONE,:new.FC_FAX,:new.FC_E_MAIL,:new.FC_HTTP,:new.FC_ROJDPLACE,:new.FK_GROUPID,vTVIDDOCfk_docvid,vtcompanyfk_companyid,vtcompany_otdelfk_otdel,vtcompany_dolgnostfk_dolgnost,systimestamp);
       elsif DELETING then
         insert into tpeoples_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTVIDDOCfk_docvid from asu.TVIDDOC t where t.fk_id = :new.fk_docvid;
         exception when others then
           vTVIDDOCfk_docvid := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_companyid from asu.tcompany t where t.fk_id = :new.fk_companyid;
         exception when others then
           vtcompanyfk_companyid := null;
         end;
        begin
          select t.fk_guid into  vtcompany_otdelfk_otdel from asu.tcompany_otdel t where t.fk_id = :new.fk_otdel;
         exception when others then
           vtcompany_otdelfk_otdel := null;
         end;
        begin
          select t.fk_guid into  vtcompany_dolgnostfk_dolgnost from asu.tcompany_dolgnost t where t.fk_id = :new.fk_dolgnost;
         exception when others then
           vtcompany_dolgnostfk_dolgnost := null;
         end;
       
         insert into tpeoples_s (FK_ID,FK_GUID,FC_FAM,FC_IM,FC_OTCH,FP_SEX,FD_ROJD,FC_DOCSER,FC_DOCNUM,FD_DOCDATE,FC_DOCVIDAN,FC_RABOTA,FC_PHONE,FC_FAX,FC_E_MAIL,FC_HTTP,FC_ROJDPLACE,FK_GROUPID,fk_docvidg,fk_companyidg,fk_otdelg,fk_dolgnostg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FP_SEX,:new.FD_ROJD,:new.FC_DOCSER,:new.FC_DOCNUM,:new.FD_DOCDATE,:new.FC_DOCVIDAN,:new.FC_RABOTA,:new.FC_PHONE,:new.FC_FAX,:new.FC_E_MAIL,:new.FC_HTTP,:new.FC_ROJDPLACE,:new.FK_GROUPID,vTVIDDOCfk_docvid,vtcompanyfk_companyid,vtcompany_otdelfk_otdel,vtcompany_dolgnostfk_dolgnost,systimestamp);
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
   end;
/
SHOW ERRORS;


--
-- TR_TPEOPLES_DATE  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TPEOPLES_DATE" 
     before INSERT OR UPDATE ON asu.tpeoples FOR EACH ROW
begin
   if :new.fd_rojd <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_rojd := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TPEOPLES','FD_ROJD', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;

   if :new.fd_docdate <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_docdate := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TPEOPLES','FD_DOCDATE', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;
exception when others then
     begin
       null;
     end;
end;
/
SHOW ERRORS;


--
-- TPEOPLES_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 -- IF NVL(:NEW.FK_ID, -1) = -1 THEN
     SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 -- END IF;
  INSERT INTO TWORKPLACE
   (FK_COMPANY, FK_OTDEL, FK_DOLGNOST, FC_RABOTA, FP_MAIN, FK_PACID)
  VALUES
  (:NEW.FK_COMPANYID, :NEW.FK_OTDEL, :NEW.FK_DOLGNOST, :NEW.FC_RABOTA, 1, :NEW.FK_ID);

  --  insert into TAdress (FK_PACID) VALUES(:NEW.FK_ID);
End;
/
SHOW ERRORS;


--
-- TPEOPLES_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_BEFORE_UPDATE" 
  before update on tpeoples
  for each row
declare
  -- local variables here
begin
  UPDATE TWORKPLACE
     SET FK_COMPANY = :NEW.FK_COMPANYID,
         FK_OTDEL = :NEW.FK_OTDEL,
         FK_DOLGNOST = :NEW.FK_DOLGNOST,
         FC_RABOTA = :NEW.FC_RABOTA
   WHERE FK_PACID = :NEW.FK_ID
     AND FP_MAIN = 1;
end TPEOPLES_BEFORE_UPDATE;
/
SHOW ERRORS;


--
-- TPEOPLES_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_DELETE_ALL" 
  AFTER DELETE ON ASU.TPEOPLES   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  Delete from TADRESS where FK_PACID = :OLD.FK_ID;
  Delete from TINSURANCE where FK_PEPLID = :OLD.FK_ID;
  Delete from TKARTA where FK_PEPLID = :OLD.FK_ID;
  Delete from TAMBULANCE where FK_PEPLID = :OLD.FK_ID;
  Delete from TDOC where FK_PACID= :OLD.FK_ID;
  DELETE FROM TIB WHERE FK_PACID = :OLD.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID CONNECT BY FK_OWNER = PRIOR FK_ID START WITH FK_ID = GET_PERSON);
end;
/
SHOW ERRORS;


--
-- TPEOPLES_LOG  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_FAM), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_IM', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_IM), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FC_OTCH', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_OTCH), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FD_ROJD', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_ROJD), null, :old.fk_id);
      PKG_LOG.Do_log('TPEOPLES', 'FK_COMPANYID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_COMPANYID), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TPEOPLES', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TPEOPLES', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
  end if;
END TPEOPLES_LOG;
/
SHOW ERRORS;


--
-- TPEOPLES_A_DEL  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_A_DEL"
 AFTER DELETE
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD
 FOR EACH ROW
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_TPEOPLES WHERE FK_PEPLID = :OLD.FK_ID;

 IF vCnt <> -1979
 THEN
  UPDATE ASU.TEXP_TPEOPLES
  SET FD_LAST_UPDATE = SYSDATE, FP_DEL = 1
  WHERE FK_PEPLID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


--
-- TPEOPLES_A_INS  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_A_INS"
 AFTER INSERT
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN

  INSERT INTO ASU.TEXP_TPEOPLES(FK_PEPLID)
  VALUES(:NEW.FK_ID);

End;
/
SHOW ERRORS;


--
-- TPEOPLES_A_UPDT  (Trigger) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_A_UPDT"
 AFTER UPDATE
 ON ASU.TPEOPLES  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_TPEOPLES WHERE FK_PEPLID = :NEW.FK_ID;

 IF vCnt = -1979
 THEN
  INSERT INTO ASU.TEXP_TPEOPLES(FK_PEPLID)
  VALUES(:NEW.FK_ID);
 ELSE
  UPDATE ASU.TEXP_TPEOPLES
  SET FD_LAST_UPDATE = SYSDATE
  WHERE FK_PEPLID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


DROP SYNONYM BUH.TPEOPLES
/

--
-- TPEOPLES  (Synonym) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE SYNONYM BUH.TPEOPLES FOR ASU.TPEOPLES
/


DROP SYNONYM STAT.TPEOPLES
/

--
-- TPEOPLES  (Synonym) 
--
--  Dependencies: 
--   TPEOPLES (Table)
--
CREATE SYNONYM STAT.TPEOPLES FOR ASU.TPEOPLES
/


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TPEOPLES TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TPEOPLES TO EXCH43
/

GRANT DELETE, INSERT, SELECT, UPDATE ON ASU.TPEOPLES TO LOGIN
/

