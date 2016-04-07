ALTER TABLE ASU.TAMBULANCE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TAMBULANCE CASCADE CONSTRAINTS
/

--
-- TAMBULANCE  (Table) 
--
CREATE TABLE ASU.TAMBULANCE
(
  FK_ID         NUMBER(15)                      DEFAULT -1                    NOT NULL,
  FK_IBID       NUMBER(6),
  FK_IBY        NUMBER(4),
  FC_FAM        VARCHAR2(30 BYTE),
  FC_IM         VARCHAR2(30 BYTE),
  FC_OTCH       VARCHAR2(30 BYTE),
  FC_RABOTA     VARCHAR2(255 BYTE),
  FD_ROJD       DATE,
  FP_SEX        NUMBER(1)                       DEFAULT -1,
  FC_ADR        VARCHAR2(200 BYTE),
  FL_VOV        NUMBER(1)                       DEFAULT 0,
  FL_IVOV       NUMBER(1)                       DEFAULT 0,
  FL_ULA        NUMBER(1)                       DEFAULT 0,
  FL_PMC        NUMBER(15)                      DEFAULT 0,
  FK_GROUPID    NUMBER(15)                      DEFAULT 6,
  FC_PUT        VARCHAR2(10 BYTE),
  FK_PRIZN      NUMBER(15)                      DEFAULT 0,
  FL_VYB        VARCHAR2(1 BYTE)                DEFAULT 0,
  FC_PHONE      VARCHAR2(30 BYTE),
  FC_RECOM      VARCHAR2(60 BYTE),
  FL_POKAZ      NUMBER(1)                       DEFAULT 0,
  FK_PEPLID     NUMBER(15),
  FK_DOCOBSL    INTEGER,
  FK_UCHID      NUMBER(15),
  FK_GUID       VARCHAR2(32 BYTE)               DEFAULT sys_guid(),
  FC_ROJDPLACE  VARCHAR2(4000 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          22048K
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

COMMENT ON TABLE ASU.TAMBULANCE IS 'Амбулаторные пациенты by TimurLan '
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_IBID IS '1я часть номера ИБ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_IBY IS '2я часть номера ИБ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_FAM IS 'Фамилия'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_IM IS 'Имя'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_OTCH IS 'Отчество'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_RABOTA IS 'Место работы'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FD_ROJD IS 'дата рождения'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FP_SEX IS 'пол (1-м, 0-ж)'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_ADR IS 'домашний адрес'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_VOV IS 'признак участник ВОВ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_IVOV IS 'признак инвалид ВОВ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_ULA IS 'признак ликвидатор'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_PMC IS 'признак работник ПМЦ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_GROUPID IS 'TGROUP.FK_ID'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_PUT IS 'номер путевки'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_PRIZN IS 'TPRIZN.FK_ID'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_VYB IS 'признак архивной ИБ'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_PHONE IS 'номер телефона'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FC_RECOM IS 'рекомендации лечащего врача'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FL_POKAZ IS 'нет данных'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_PEPLID IS 'key to TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_DOCOBSL IS 'key to TDOCOBSL.FK_ID'
/

COMMENT ON COLUMN ASU.TAMBULANCE.FK_UCHID IS 'Терапевтический участок пациента'
/


--
-- IDX_TAMBULANCE_GUID  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE INDEX ASU.IDX_TAMBULANCE_GUID ON ASU.TAMBULANCE
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
-- TAMBULANCE_BY_FIO  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE INDEX ASU.TAMBULANCE_BY_FIO ON ASU.TAMBULANCE
(FC_FAM, FC_OTCH, FC_IM, FD_ROJD)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          17072K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAMBULANCE_BY_FK_PEPLID  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE INDEX ASU.TAMBULANCE_BY_FK_PEPLID ON ASU.TAMBULANCE
(FK_PEPLID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6112K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAMBULANCE_BY_ID  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE UNIQUE INDEX ASU.TAMBULANCE_BY_ID ON ASU.TAMBULANCE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAMBULANCE_BY_ID_PEPLID  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE UNIQUE INDEX ASU.TAMBULANCE_BY_ID_PEPLID ON ASU.TAMBULANCE
(FK_ID, FK_PEPLID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          7040K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAMBULANCE_DOCOBSL  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE INDEX ASU.TAMBULANCE_DOCOBSL ON ASU.TAMBULANCE
(FK_DOCOBSL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4224K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TAMBULANCE$FL_VYB  (Index) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE INDEX ASU.TAMBULANCE$FL_VYB ON ASU.TAMBULANCE
(FL_VYB)
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
-- TR_TAMBULANCE  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TAMBULANCE" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TAMBULANCE FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTPEOPLESfk_peplid varchar(32);
       vtdocobslfk_docobsl varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_id = :new.fk_peplid;
         exception when others then
           vTPEOPLESfk_peplid := null;
         end;
        begin
          select t.fk_guid into  vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_id = :new.fk_docobsl;
         exception when others then
           vtdocobslfk_docobsl := null;
         end;
       
         insert into TAMBULANCE_s (FK_ID,FK_GUID,FK_IBID,FK_IBY,FC_FAM,FC_IM,FC_OTCH,FC_RABOTA,FD_ROJD,FP_SEX,FC_ADR,FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_GROUPID,FC_PUT,FK_PRIZN,FL_VYB,FC_PHONE,FC_RECOM,FL_POKAZ,FK_UCHID,fk_peplidg,fk_docobslg,fd_edittime)
              values (0,:new.FK_GUID,:new.FK_IBID,:new.FK_IBY,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FC_RABOTA,:new.FD_ROJD,:new.FP_SEX,:new.FC_ADR,:new.FL_VOV,:new.FL_IVOV,:new.FL_ULA,:new.FL_PMC,:new.FK_GROUPID,:new.FC_PUT,:new.FK_PRIZN,:new.FL_VYB,:new.FC_PHONE,:new.FC_RECOM,:new.FL_POKAZ,:new.FK_UCHID,vTPEOPLESfk_peplid,vtdocobslfk_docobsl,systimestamp);
       elsif DELETING then
         insert into TAMBULANCE_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTPEOPLESfk_peplid from asu.TPEOPLES t where t.fk_id = :new.fk_peplid;
         exception when others then
           vTPEOPLESfk_peplid := null;
         end;
        begin
          select t.fk_guid into  vtdocobslfk_docobsl from asu.tdocobsl t where t.fk_id = :new.fk_docobsl;
         exception when others then
           vtdocobslfk_docobsl := null;
         end;
       
         insert into TAMBULANCE_s (FK_ID,FK_GUID,FK_IBID,FK_IBY,FC_FAM,FC_IM,FC_OTCH,FC_RABOTA,FD_ROJD,FP_SEX,FC_ADR,FL_VOV,FL_IVOV,FL_ULA,FL_PMC,FK_GROUPID,FC_PUT,FK_PRIZN,FL_VYB,FC_PHONE,FC_RECOM,FL_POKAZ,FK_UCHID,fk_peplidg,fk_docobslg,fd_edittime)
              values (2,:new.FK_GUID,:new.FK_IBID,:new.FK_IBY,:new.FC_FAM,:new.FC_IM,:new.FC_OTCH,:new.FC_RABOTA,:new.FD_ROJD,:new.FP_SEX,:new.FC_ADR,:new.FL_VOV,:new.FL_IVOV,:new.FL_ULA,:new.FL_PMC,:new.FK_GROUPID,:new.FC_PUT,:new.FK_PRIZN,:new.FL_VYB,:new.FC_PHONE,:new.FC_RECOM,:new.FL_POKAZ,:new.FK_UCHID,vTPEOPLESfk_peplid,vtdocobslfk_docobsl,systimestamp);
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
-- TR_TAMBULANCE_DATE  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TAMBULANCE_DATE" 
     before INSERT OR UPDATE ON asu.tambulance FOR EACH ROW
begin
   if :new.fd_rojd <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_rojd := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TAMBULANCE','FD_ROJD', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;
exception when others then
     begin
       null;
     end;
end;
/
SHOW ERRORS;


--
-- TAMBULANCE_LOG  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
--    PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCOBSL), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_peplid), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSL), null, :old.fk_id);
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TAMBULANCE', 'FС_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_fam), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_ibid), null, :old.fk_id);
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBY', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_iby), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TAMBULANCE', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    PKG_LOG.Do_log('TAMBULANCE', 'FK_PEPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), PKG_LOG.GET_VALUE(:new.FK_PEPLID), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TAMBULANCE', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
    if UPDATING ('FK_IBID') AND PKG_LOG.GET_VALUE(:old.FK_IBID) <> PKG_LOG.GET_VALUE(:new.FK_IBID) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_ibid), PKG_LOG.GET_VALUE(:new.fk_ibid), :old.fk_id);
    end if;
    if UPDATING ('FK_IBY') AND PKG_LOG.GET_VALUE(:old.FK_IBY) <> PKG_LOG.GET_VALUE(:new.FK_IBY) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_IBY', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_iby), PKG_LOG.GET_VALUE(:new.fk_iby), :old.fk_id);
    end if;
    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(:new.FK_GROUPID) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_GROUPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
    if UPDATING ('FC_PUT') AND PKG_LOG.GET_VALUE(:old.FC_PUT) <> PKG_LOG.GET_VALUE(:new.FC_PUT) then
      PKG_LOG.Do_log('TAMBULANCE', 'FC_PUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_PUT), PKG_LOG.GET_VALUE(:new.FC_PUT), :old.fk_id);
    end if;
    if UPDATING ('FK_PRIZN') AND PKG_LOG.GET_VALUE(:old.FK_PRIZN) <> PKG_LOG.GET_VALUE(:new.FK_PRIZN) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_PRIZN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRIZN), PKG_LOG.GET_VALUE(:new.FK_PRIZN), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCOBSL') AND PKG_LOG.GET_VALUE(:old.FK_DOCOBSL) <> PKG_LOG.GET_VALUE(:new.FK_DOCOBSL) then
      PKG_LOG.Do_log('TAMBULANCE', 'FK_DOCOBSL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSL), PKG_LOG.GET_VALUE(:new.FK_DOCOBSL), :old.fk_id);
    end if;
  end if;
  null;
END TAMBULANCE_LOG;
/
SHOW ERRORS;


--
-- TAMBULANCE$BD  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE$BD" 
 BEFORE 
 DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
DECLARE
CURSOR C1 is
    SELECT   fk_userid, DECODE (COUNT (fk_userid), 0, 0, 1) AS fp_support
                      FROM ASU.tmisexch_tasks_users
                  GROUP BY fk_userid;
CURSOR C2 is
    SELECT OSUSER, MACHINE, PROGRAM, MODULE, ACTION
          FROM V$SESSION
         WHERE AUDSID = USERENV('SESSIONID');
CURSOR C3 (nDocObsl IN NUMBER) is
    select NVL(tu.fc_name,  'Отсутствует') , tu.fk_id
    from tdocobsl td, tuslvid tu
    where td.FK_ID = nDocObsl and tu.fk_id =td.fk_viddocid;
    nRes NUMBER;
    sOSUSER VARCHAR2(50);
    sMACHINE VARCHAR2(100);
    sPROGRAM VARCHAR2(100);
    sMODULE VARCHAR2(100);
    sACTION VARCHAR2(100);
    sNAMEDOC VARCHAR2(100);
    nTYPEDOC NUMBER;
    sTextMSG VARCHAR2(4000);
begin
    IF :OLD.FC_FAM IS NULL THEN RETURN; end if;
    OPEN C2;
    FETCH C2 into sOSUSER, sMACHINE, sPROGRAM, sMODULE, sACTION;
    CLOSE C2;

    OPEN C3 (:OLD.FK_DOCOBSL );
    FETCH C3 into sNAMEDOC, nTYPEDOC;
    CLOSE C3;

    sTextMSG:='ВНИМАНИЕ! Осуществляется удаление из TAMBULANCE'||chr(10)
          ||'| Документ: '||sNAMEDOC||chr(10)
          ||'| № '||:OLD.FK_IBID||'/'||:OLD.FK_IBY||chr(10)
          ||'| Пациент: '||:OLD.FC_FAM||' '||:OLD.FC_IM||' '||:OLD.FC_OTCH||'  Родился: '||to_char(:OLD.FD_ROJD,'DD.MM.YYYY')||chr(10)
          ||'| Действие осуществляет пользователь "'||sOSUSER||'"  '||'  из программы "'||sPROGRAM||'"'||chr(10)
          ||'| Необходимо срочно сообщить о данном действии разработчкам в Таганрог!'
          ||chr(10)
          ||'| Техническая информация:'||chr(10)
          ||'| TAMBULANCE.FK_ID = '||:OLD.FK_ID||chr(10)
          ||'| TAMBULANCE.FK_PEPLID = '||:OLD.FK_PEPLID||chr(10)
          ||'| TAMBULANCE.FK_DOCOBSL = '||:OLD.FK_DOCOBSL||chr(10)
          ||'| TAMBULANCE.FK_UCHID = '||:OLD.FK_UCHID||chr(10)
          ||'| TUSLVID.FK_ID = '||nTYPEDOC
          ||'| работающий модуль = '||sMODULE
          ||'| описание модуля = '||sACTION
          ||'| действие осуществлено на компьютере "'||to_char(sMACHINE)||'"';

    FOR C in C1
    LOOP
        InsMSG(C.fk_userid,sTextMSG);
        /*INSERT INTO ASU.TMSG
          (FK_SENDER,
           FK_RECIEVER,
           FD_SEND,
           FC_TEXT,
           FP_NEED_READ,
           FK_BLOB,
           FP_TYPE,
           FP_MAIL,
           FK_OWNERID)
         VALUES
          (0,
          C.fk_userid,
          SYSDATE,
          sTextMSG,
          0,
          0,
          0,
          0,
          NULL);*/
    END LOOP;
  --RAISE_APPLICATION_ERROR (-20010, sTextMSG);
end;
/
SHOW ERRORS;


--
-- TAMBULANCE_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_AFTER_DELETE" 
 AFTER
 DELETE
 ON asu.TAMBULANCE
 REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  DELETE FROM MEDSERV.TMEDSERVPERFORM t WHERE t.FK_KARTA=:OLD.FK_ID;
End;
/
SHOW ERRORS;


--
-- TAMBULANCE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
/*  :NEW.FK_IBY:=TO_CHAR(SYSDATE,'YYYY');
  SELECT MAX(FK_IBID)+1 INTO :NEW.FK_IBID FROM TAMBULANCE WHERE  FK_IBY=:NEW.FK_IBY;
  IF :NEW.FK_IBID is NULL then
    :NEW.FK_IBID:=1;
  end IF;
*/
  insert into TANAMNEZ (FK_PACID,FL_AMB) VALUES(:NEW.FK_ID,1);
  insert into TEPID (FK_PACID,FL_AMB) VALUES(:NEW.FK_ID,1);
  insert into TAMBVRACH (FK_PACID,FL_VID) VALUES(:NEW.FK_ID,'M');
End;
/
SHOW ERRORS;


--
-- TAMBULANCE_A_DEL  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_A_DEL"
 AFTER DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD
 FOR EACH ROW
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_TPACKART WHERE FK_PACID = :OLD.FK_ID;

 IF vCnt <> -1979
 THEN
  UPDATE ASU.TEXP_TPACKART
  SET FD_LAST_UPDATE = SYSDATE, FP_DEL = 1
  WHERE FK_PACID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


--
-- TAMBULANCE_A_INS  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_A_INS"
 AFTER INSERT
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  INSERT INTO ASU.TEXP_TPACKART(FK_PACID, FP_ISABULANCE)
  VALUES(:NEW.FK_ID, 1);
End;
/
SHOW ERRORS;


--
-- TAMBULANCE_A_UPDT  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_A_UPDT"
 AFTER UPDATE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_TPACKART WHERE FK_PACID = :NEW.FK_ID;

 IF vCnt = -1979
 THEN
  INSERT INTO ASU.TEXP_TPACKART(FK_PACID, FP_ISABULANCE)
  VALUES(:NEW.FK_ID, 1);
 ELSE
  UPDATE ASU.TEXP_TPACKART
  SET FD_LAST_UPDATE = SYSDATE
  WHERE FK_PACID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


--
-- TAMBULANCE_DELETE_PROFFACT  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU.TAMBULANCE_DELETE_PROFFACT
 AFTER
 DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  DELETE FROM tprofp_list WHERE fk_ambulanceid = :OLD.FK_ID; --by vital 08/11/12
  DELETE FROM tproffactor_peoples WHERE FK_PACID = :OLD.FK_ID AND fn_type = 1; --by vital 08/11/12

End;
/
SHOW ERRORS;


--
-- TAMBULANCE_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE OR REPLACE TRIGGER ASU.TAMBULANCE_DELETE_ALL
 AFTER
 DELETE
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  Delete from TAMBVRACH where fk_pacid = :old.fk_id;
  Delete from TANAMBOL where fk_pacid = :old.fk_id;
  Delete from TANAMNEZ where fk_pacid = :old.fk_id;
  Delete from TANTROP where fk_pacid = :old.fk_id;
  Delete from TDATATEST where fk_pacid = :old.fk_id;
  Delete from TDEGREMARK where fk_pacid = :old.fk_id;
  Delete from TDIAG where fk_pacid = :old.fk_id;
  Delete from TEPID where fk_pacid = :old.fk_id;
  Delete from TEPIKRIZ where fk_pacid = :old.fk_id;
  Delete from TIB where fk_pacid = :old.fk_id;
  Delete from TNAZDEG where fk_pacid = :old.fk_id;
  Delete from TPACKATEGORIA where fk_pacid = :old.fk_id;
  Delete from TPREDDIAG where fk_pacid = :old.fk_id;
  Delete from TTECHBOLEZNI where fk_pacid = :old.fk_id;
  Delete from TTEMPSROKY where fk_pacid = :old.fk_id;
  Delete from VNAZ where fk_pacid = :old.fk_id;
  Delete from VRES where fk_pacid = :old.fk_id;
  Delete From TLABREG WHERE FK_PACID = :OLD.FK_ID;
  Delete From TNAZAN WHERE FK_PACID = :OLD.FK_ID;
  Delete From TRESAN WHERE FK_PACID = :OLD.FK_ID;
  DELETE FROM TDOC WHERE FK_KARTAID = :OLD.FK_ID; --by TimurLan 19/08/04
  DELETE FROM tprofp_list WHERE fk_ambulanceid = :OLD.FK_ID; --by vital 08/11/12
  DELETE FROM tproffactor_peoples WHERE FK_PACID = :OLD.FK_ID AND fn_type = 1; --by vital 08/11/12

End;
/
SHOW ERRORS;


DROP SYNONYM BUH.TAMBULANCE
/

--
-- TAMBULANCE  (Synonym) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE SYNONYM BUH.TAMBULANCE FOR ASU.TAMBULANCE
/


DROP SYNONYM MED.TAMBULANCE
/

--
-- TAMBULANCE  (Synonym) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE SYNONYM MED.TAMBULANCE FOR ASU.TAMBULANCE
/


DROP SYNONYM STAT.TAMBULANCE
/

--
-- TAMBULANCE  (Synonym) 
--
--  Dependencies: 
--   TAMBULANCE (Table)
--
CREATE SYNONYM STAT.TAMBULANCE FOR ASU.TAMBULANCE
/


-- 
-- Non Foreign Key Constraints for Table TAMBULANCE 
-- 
ALTER TABLE ASU.TAMBULANCE ADD (
  CONSTRAINT TAMBULANCE_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          4M
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT INSERT, REFERENCES, SELECT, UPDATE ON ASU.TAMBULANCE TO EXCH43
/

