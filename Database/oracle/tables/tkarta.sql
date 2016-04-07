ALTER TABLE ASU.TKARTA
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TKARTA CASCADE CONSTRAINTS
/

--
-- TKARTA  (Table) 
--
CREATE TABLE ASU.TKARTA
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FK_IBID       NUMBER(9),
  FK_IBY        NUMBER(4),
  FC_FAM        VARCHAR2(100 BYTE),
  FC_IM         VARCHAR2(100 BYTE),
  FC_OTCH       VARCHAR2(100 BYTE),
  FC_RABOTA     VARCHAR2(250 BYTE),
  FD_ROJD       DATE,
  FP_SEX        NUMBER(1)                       DEFAULT -1,
  FK_COUNTRYID  NUMBER(15)                      DEFAULT -1,
  FK_REGIONID   NUMBER(15)                      DEFAULT -1,
  FK_TOWNID     NUMBER(15)                      DEFAULT -1,
  FC_ADR        VARCHAR2(120 BYTE),
  FK_COC_POLID  NUMBER(15)                      DEFAULT -1,
  FL_VOV        NUMBER(1)                       DEFAULT 0,
  FL_IVOV       NUMBER(1)                       DEFAULT 0,
  FL_ULA        NUMBER(1)                       DEFAULT 0,
  FL_HRAP       NUMBER(1)                       DEFAULT 0,
  FL_PMC        NUMBER(15)                      DEFAULT 0,
  FK_GROUPID    NUMBER(15)                      DEFAULT -1,
  FC_PUT        VARCHAR2(50 BYTE),
  FK_KOD        NUMBER(15)                      DEFAULT -1,
  FK_KOD2       NUMBER(15)                      DEFAULT 3,
  FC_RECOM      VARCHAR2(60 BYTE),
  FP_TEK_COC    NUMBER(1)                       DEFAULT 1,
  FL_DOR        NUMBER(1)                       DEFAULT 1,
  FC_FAX        VARCHAR2(30 BYTE),
  FC_HTTP       VARCHAR2(100 BYTE),
  FC_E_MAIL     VARCHAR2(40 BYTE),
  FC_PHONE      VARCHAR2(30 BYTE),
  FL_SPUTNIK    NUMBER(1)                       DEFAULT -1,
  FK_MASTER     NUMBER(15)                      DEFAULT -1,
  FL_BUH        NUMBER(1)                       DEFAULT 0,
  OLDID         NUMBER,
  FK_PRIZN      NUMBER(15)                      DEFAULT -1,
  FN_SUM        NUMBER(17,2)                    DEFAULT 0,
  FL_AMB        NUMBER(1)                       DEFAULT 0,
  FL_VYB        VARCHAR2(1 BYTE)                DEFAULT 0,
  FL_KONTROL    NUMBER(1)                       DEFAULT 0,
  FK_PUTTYPE    NUMBER(16)                      DEFAULT -1,
  FC_STRSER     VARCHAR2(10 BYTE),
  FC_STRNUM     VARCHAR2(10 BYTE),
  FK_STRVID     NUMBER(15)                      DEFAULT 0,
  FK_STRCOMP    NUMBER(15)                      DEFAULT 0,
  FK_STRTERR    NUMBER(15)                      DEFAULT 0,
  FK_DOCVID     NUMBER(15)                      DEFAULT -1,
  FC_DOCSER     VARCHAR2(10 BYTE),
  FC_DOCNUM     VARCHAR2(10 BYTE),
  FC_DOCVIDAN   VARCHAR2(100 BYTE),
  FD_DOCDATE    DATE,
  FK_WORKCOMP   NUMBER(15)                      DEFAULT 0,
  FL_CHANGE     NUMBER(1)                       DEFAULT 2,
  FL_FIRST      NUMBER(1)                       DEFAULT 1,
  FK_FINVIDID   NUMBER(9)                       DEFAULT -1,
  FK_SESSIONID  NUMBER(9),
  FK_SANID      NUMBER(9)                       DEFAULT -1,
  FK_USLVIDID   NUMBER(9)                       DEFAULT -1,
  FL_POKAZ      NUMBER(1)                       DEFAULT 0,
  FL_SKK        NUMBER(1)                       DEFAULT 0,
  FL_SEO        NUMBER(1)                       DEFAULT 0,
  FP_RESLECH    NUMBER(1)                       DEFAULT 1,
  FL_VYB2       NUMBER(1)                       DEFAULT 0,
  FL_NEW        NUMBER(1)                       DEFAULT 1,
  FL_ILL        NUMBER(1)                       DEFAULT 0,
  FC_ROJDPLACE  VARCHAR2(200 BYTE),
  FL_PLANNED    NUMBER(1)                       DEFAULT 0,
  FL_PRIVIT     NUMBER(1)                       DEFAULT 0,
  FK_PACVID     NUMBER(15)                      DEFAULT -1,
  FL_PAYPLACE   NUMBER(1)                       DEFAULT 0,
  FK_PEPLID     NUMBER(15),
  FK_STOLID     NUMBER(15)                      DEFAULT -1,
  FN_FLUR       VARCHAR2(15 BYTE),
  FD_FLUR       DATE,
  FL_FLUR       NUMBER(1),
  FC_FLUR       VARCHAR2(100 BYTE),
  FK_ROOM       NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          12320K
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

COMMENT ON TABLE ASU.TKARTA IS 'Список пациентов by TimurLan '
/

COMMENT ON COLUMN ASU.TKARTA.FL_FIRST IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TKARTA.FK_FINVIDID IS 'TFINVID.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FK_SESSIONID IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TKARTA.FK_SANID IS 'код междучреждения'
/

COMMENT ON COLUMN ASU.TKARTA.FK_USLVIDID IS 'вид услуг'
/

COMMENT ON COLUMN ASU.TKARTA.FL_POKAZ IS 'Показано-ли лечение в санатории?'
/

COMMENT ON COLUMN ASU.TKARTA.FL_SKK IS 'С санаторно-курортной картой?'
/

COMMENT ON COLUMN ASU.TKARTA.FL_SEO IS 'С санитарно эпидемиологическим обследованием?'
/

COMMENT ON COLUMN ASU.TKARTA.FP_RESLECH IS '0 - знач улучше, 1 - улучш, 2 - без улучшения, 3 - ухудшение, 4- умер, 5-выздоровление, 6-здоров'
/

COMMENT ON COLUMN ASU.TKARTA.FL_VYB2 IS 'Выписка 2:)'
/

COMMENT ON COLUMN ASU.TKARTA.FL_NEW IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TKARTA.FL_ILL IS 'Отправлялся ли в больницу во время лечения? (1 - да)'
/

COMMENT ON COLUMN ASU.TKARTA.FC_ROJDPLACE IS 'Место рождения'
/

COMMENT ON COLUMN ASU.TKARTA.FL_PLANNED IS 'Если был заплпнирован АРМом Планирование'
/

COMMENT ON COLUMN ASU.TKARTA.FL_PRIVIT IS 'Был ли привит нужными прививками?'
/

COMMENT ON COLUMN ASU.TKARTA.FK_PACVID IS 'КОД вида пациента (TPACVID)'
/

COMMENT ON COLUMN ASU.TKARTA.FL_PAYPLACE IS 'Где оплата?'
/

COMMENT ON COLUMN ASU.TKARTA.FK_PEPLID IS 'id пациента в списке клиентов (TPEOPLES)'
/

COMMENT ON COLUMN ASU.TKARTA.FK_STOLID IS 'Код столовой'
/

COMMENT ON COLUMN ASU.TKARTA.FN_FLUR IS 'Номер флюорограммы'
/

COMMENT ON COLUMN ASU.TKARTA.FD_FLUR IS 'Дата флюорограммы'
/

COMMENT ON COLUMN ASU.TKARTA.FL_FLUR IS 'Результат флюорограммы (1 - патология, 0 - без патологии)'
/

COMMENT ON COLUMN ASU.TKARTA.FC_FLUR IS 'Если есть патология, то название'
/

COMMENT ON COLUMN ASU.TKARTA.FK_ROOM IS 'TROOM.FK_ID  палата в которой пациент лежит (выписан)'
/

COMMENT ON COLUMN ASU.TKARTA.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TKARTA.FK_IBID IS '1-я часть номера ИБ'
/

COMMENT ON COLUMN ASU.TKARTA.FK_IBY IS '2-я часть номера ИБ'
/

COMMENT ON COLUMN ASU.TKARTA.FC_FAM IS 'фамилия'
/

COMMENT ON COLUMN ASU.TKARTA.FC_IM IS 'имя'
/

COMMENT ON COLUMN ASU.TKARTA.FC_OTCH IS 'отчество'
/

COMMENT ON COLUMN ASU.TKARTA.FC_RABOTA IS 'место работы'
/

COMMENT ON COLUMN ASU.TKARTA.FD_ROJD IS 'дата рождения'
/

COMMENT ON COLUMN ASU.TKARTA.FP_SEX IS 'пол'
/

COMMENT ON COLUMN ASU.TKARTA.FK_COUNTRYID IS 'TCOUNTRY.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FK_REGIONID IS 'TREGION.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FK_TOWNID IS 'TTOWN.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FC_ADR IS 'адрес'
/

COMMENT ON COLUMN ASU.TKARTA.FK_COC_POLID IS 'Социальное положение, ссылка на TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FL_VOV IS 'признак "ветеран ВОВ'
/

COMMENT ON COLUMN ASU.TKARTA.FL_IVOV IS 'признак "инвалид ВОВ'
/

COMMENT ON COLUMN ASU.TKARTA.FL_ULA IS 'признак "ликвидатор'
/

COMMENT ON COLUMN ASU.TKARTA.FL_HRAP IS 'храпит?'
/

COMMENT ON COLUMN ASU.TKARTA.FL_PMC IS 'признак "сотрудник ПМЦ'
/

COMMENT ON COLUMN ASU.TKARTA.FK_GROUPID IS 'TGROUP.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FC_PUT IS 'номер путевки'
/

COMMENT ON COLUMN ASU.TKARTA.FK_KOD IS 'TSUBVID.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FK_KOD2 IS 'TVID.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FC_RECOM IS 'рекомендации'
/

COMMENT ON COLUMN ASU.TKARTA.FP_TEK_COC IS 'признак состяния записи'
/

COMMENT ON COLUMN ASU.TKARTA.FL_DOR IS 'признак "к доработке'
/

COMMENT ON COLUMN ASU.TKARTA.FC_FAX IS 'факс'
/

COMMENT ON COLUMN ASU.TKARTA.FC_HTTP IS 'вэб адрес'
/

COMMENT ON COLUMN ASU.TKARTA.FC_E_MAIL IS 'е-почта'
/

COMMENT ON COLUMN ASU.TKARTA.FC_PHONE IS 'телефон'
/

COMMENT ON COLUMN ASU.TKARTA.FL_SPUTNIK IS 'наличие сопровождающего'
/

COMMENT ON COLUMN ASU.TKARTA.FK_MASTER IS 'признак сопровождающего'
/

COMMENT ON COLUMN ASU.TKARTA.FL_BUH IS 'учет по бухгалтерии'
/

COMMENT ON COLUMN ASU.TKARTA.OLDID IS 'служебное поле'
/

COMMENT ON COLUMN ASU.TKARTA.FK_PRIZN IS 'TPRIZN.FK_ID'
/

COMMENT ON COLUMN ASU.TKARTA.FN_SUM IS 'сумма'
/

COMMENT ON COLUMN ASU.TKARTA.FL_AMB IS 'признак амбулаторного'
/

COMMENT ON COLUMN ASU.TKARTA.FL_VYB IS 'признак выписки'
/

COMMENT ON COLUMN ASU.TKARTA.FL_KONTROL IS 'признак контроля врачом'
/

COMMENT ON COLUMN ASU.TKARTA.FK_PUTTYPE IS 'тип путевки'
/

COMMENT ON COLUMN ASU.TKARTA.FC_STRSER IS 'серия страхового полиса'
/

COMMENT ON COLUMN ASU.TKARTA.FC_STRNUM IS 'номер страхового полиса'
/

COMMENT ON COLUMN ASU.TKARTA.FK_STRVID IS 'вид страхового полиса'
/

COMMENT ON COLUMN ASU.TKARTA.FK_STRCOMP IS 'компания страхового полиса'
/

COMMENT ON COLUMN ASU.TKARTA.FK_STRTERR IS 'регион страхового полиса'
/

COMMENT ON COLUMN ASU.TKARTA.FK_DOCVID IS 'вид документа удостоверяющего личность'
/

COMMENT ON COLUMN ASU.TKARTA.FC_DOCSER IS 'серия документа'
/

COMMENT ON COLUMN ASU.TKARTA.FC_DOCNUM IS 'номер документа'
/

COMMENT ON COLUMN ASU.TKARTA.FC_DOCVIDAN IS 'кем выдан документ'
/

COMMENT ON COLUMN ASU.TKARTA.FD_DOCDATE IS 'когда выдан документ'
/

COMMENT ON COLUMN ASU.TKARTA.FK_WORKCOMP IS 'место работы'
/

COMMENT ON COLUMN ASU.TKARTA.FL_CHANGE IS 'служебное поле'
/


--
-- TKARTA_BY_FK_COC_POLID  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA_BY_FK_COC_POLID ON ASU.TKARTA
(FK_COC_POLID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA_BY_FL_FIRST_FK_ID  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE UNIQUE INDEX ASU.TKARTA_BY_FL_FIRST_FK_ID ON ASU.TKARTA
(FL_FIRST, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA_BY_ID  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE UNIQUE INDEX ASU.TKARTA_BY_ID ON ASU.TKARTA
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA_BY_PEPLID  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA_BY_PEPLID ON ASU.TKARTA
(FK_PEPLID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          416K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA$FKROOM$TEK_SOS  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA$FKROOM$TEK_SOS ON ASU.TKARTA
(FK_ROOM, FP_TEK_COC)
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
-- TKARTA_IBID_IBY  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA_IBID_IBY ON ASU.TKARTA
(FK_IBID, FK_IBY)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA_I_FK_COUNTRYID  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA_I_FK_COUNTRYID ON ASU.TKARTA
(FK_COUNTRYID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA$SEX  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA$SEX ON ASU.TKARTA
(FP_SEX)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TKARTA_VYB  (Index) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE INDEX ASU.TKARTA_VYB ON ASU.TKARTA
(FL_VYB)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TR_TKARTA_DATE  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TKARTA_DATE" 
     before INSERT OR UPDATE ON asu.tkarta FOR EACH ROW
begin
   if :new.fd_rojd <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_rojd := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TKARTA','FD_ROJD', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;

   if :new.fd_docdate <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_docdate := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TKARTA','FD_DOCDATE', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;

   if :new.fd_flur <= to_date('01.01.1880','dd.mm.yyyy') then
     :new.fd_flur := null;
     insert into asu.CORRECTDATE_LOG (TAB, col, ID, DATE_INS, usr_module, usr_TERMINAL)
       values ('TKARTA','FD_FLUR', :new.fk_id, sysdate, SYS_CONTEXT ('USERENV','MODULE'), SYS_CONTEXT ('USERENV','TERMINAL'));
   end if;
exception when others then
     begin
       null;
     end;
end;
/
SHOW ERRORS;


--
-- TKARTA_AS_DEL_CALL_STACK  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_AS_DEL_CALL_STACK" 
 AFTER
  DELETE
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  delete from asu.tkartacallstack where FK_ID = :NEW.FK_ID;
END;
/
SHOW ERRORS;


--
-- TKARTA_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT SID INTO :NEW.FK_SESSIONID FROM v$MYstat where rownum=1;
-- Rem/UnRem by TimurLan ^^^^^
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
/*  SELECT MAX(FK_IBID)+1 INTO :NEW.FK_IBID FROM TKARTA WHERE
    FK_IBY=TO_CHAR(SYSDATE,'YYYY');
  IF :NEW.FK_IBID is NULL then
    :NEW.FK_IBID:=1;
  end IF;
  :NEW.FK_IBY:=TO_CHAR(SYSDATE,'YYYY');
*/INSERT INTO TANAMNEZ (FK_PACID,FL_AMB) VALUES (:NEW.FK_ID,0);
  INSERT INTO TEPID (FK_PACID,FL_AMB) VALUES (:NEW.FK_ID,0);
  insert into TVRACH (FK_PACID,FL_VID) VALUES(:NEW.FK_ID,'M');
End;
/
SHOW ERRORS;


--
-- TKARTA_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_BEFORE_UPDATE" 
 BEFORE
  UPDATE
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  :NEW.FK_SESSIONID:='-1';
End;
/
SHOW ERRORS;


--
-- TKARTA_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_DELETE_ALL" 
  AFTER DELETE ON asu.tkarta
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
DECLARE
  cTemp Varchar2(30);
  CURSOR cTabs is
    select tcc.owner || '.' || tcc.table_name as table_name
      from dba_col_comments tcc
      left join dba_objects tdo on tdo.owner = tcc.owner
                               and tdo.object_name = tcc.table_name
     where tcc.column_name = 'FK_PACID'
       and tdo.object_type = 'TABLE'
       and tdo.status = 'VALID'
       and tcc.owner in ('ASU', 'LOGIN', 'STAT', 'MED', 'BUH')
       and tcc.table_name NOT LIKE '%$%$%' -- исключили таблицы в корзине
       and tcc.TABLE_NAME not in ('TADRESS', 'VRESAN', 'VRESPAT', 'VNAZAN', 'TPUTSPLANS', 'TDOC');

Begin
  INSNAZ.BINS := TRUE;

  FOR p IN cTabs LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DELETE FROM ' || p.TABLE_NAME || ' WHERE FK_PACID=:FK_PACID'
        USING :OLD.FK_ID;
    EXCEPTION
      WHEN OTHERS THEN
--        dbms_output.put_line(p.table_name);
        raise;
    END;
  END LOOP;

  /* COMMENTED BY SILL 10.20.06*/
  --  DELETE FROM TNAZMEDLECHVID WHERE PACID=:OLD.FK_ID;
  DELETE FROM TMARKS WHERE PACID = :OLD.FK_ID;
  DELETE FROM TDOC WHERE FK_KARTAID = :OLD.FK_ID;

  select UPPER(status) into cTemp from sys.all_triggers where UPPER(trigger_name) = 'TPUTSPLANS_DELETE_ALL';
  if cTemp = 'ENABLED' then
    UPDATE TPutsPlans SET FK_PACID = -1, FL_USED = 0 WHERE FK_PACID = :OLD.FK_ID;
  end if;

  INSNAZ.BINS := FALSE;
end;
/
SHOW ERRORS;


--
-- TKARTA_DELETE_TPATALOGY  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_DELETE_TPATALOGY" 
 AFTER
  UPDATE
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :NEW.FL_VYB=1 THEN
    DELETE FROM TPATALOGY WHERE FK_PACID=:OLD.FK_ID;
  END IF;
End;
/
SHOW ERRORS;


--
-- TKARTA_LOG  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TKARTA  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TKARTA', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
      PKG_LOG.Do_log('TKARTA', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_peplid), null, :old.fk_id);
    if :old.fc_fam is not null then
      PKG_LOG.Do_log('TKARTA', 'FС_FAM', 'DELETE', PKG_LOG.GET_VALUE(:old.fc_fam), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_IBID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_ibid), null, :old.fk_id);
      PKG_LOG.Do_log('TKARTA', 'FK_IBY', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_iby), null, :old.fk_id);
    end if;
  elsif UPDATING then
    PKG_LOG.Do_log('TKARTA', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    PKG_LOG.Do_log('TKARTA', 'FK_PEPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), PKG_LOG.GET_VALUE(:new.FK_PEPLID), :old.fk_id);
    if UPDATING ('FC_FAM') AND PKG_LOG.GET_VALUE(:old.FC_FAM) <> PKG_LOG.GET_VALUE(:new.FC_FAM) then
      PKG_LOG.Do_log('TKARTA', 'FC_FAM', 'UPDATE', PKG_LOG.GET_VALUE(:old.fc_fam), PKG_LOG.GET_VALUE(:new.fc_fam), :old.fk_id);
    end if;
    if UPDATING ('FK_IBID') AND PKG_LOG.GET_VALUE(:old.FK_IBID) <> PKG_LOG.GET_VALUE(:new.FK_IBID) then
      PKG_LOG.Do_log('TKARTA', 'FK_IBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_ibid), PKG_LOG.GET_VALUE(:new.fk_ibid), :old.fk_id);
    end if;
    if UPDATING ('FK_IBY') AND PKG_LOG.GET_VALUE(:old.FK_IBY) <> PKG_LOG.GET_VALUE(:new.FK_IBY) then
      PKG_LOG.Do_log('TKARTA', 'FK_IBY', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_iby), PKG_LOG.GET_VALUE(:new.fk_iby), :old.fk_id);
    end if;
    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(:new.FK_GROUPID) then
      PKG_LOG.Do_log('TKARTA', 'FK_GROUPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
    if UPDATING ('FC_PUT') AND PKG_LOG.GET_VALUE(:old.FC_PUT) <> PKG_LOG.GET_VALUE(:new.FC_PUT) then
      PKG_LOG.Do_log('TKARTA', 'FC_PUT', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_PUT), PKG_LOG.GET_VALUE(:new.FC_PUT), :old.fk_id);
    end if;
    if UPDATING ('FK_KOD') AND PKG_LOG.GET_VALUE(:old.FK_KOD) <> PKG_LOG.GET_VALUE(:new.FK_KOD) then
      PKG_LOG.Do_log('TKARTA', 'FK_KOD', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_KOD), PKG_LOG.GET_VALUE(:new.FK_KOD), :old.fk_id);
    end if;
    if UPDATING ('FK_KOD2') AND PKG_LOG.GET_VALUE(:old.FK_KOD2) <> PKG_LOG.GET_VALUE(:new.FK_KOD2) then
      PKG_LOG.Do_log('TKARTA', 'FK_KOD2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_KOD2), PKG_LOG.GET_VALUE(:new.FK_KOD2), :old.fk_id);
    end if;
    if UPDATING ('FP_TEK_COC') AND PKG_LOG.GET_VALUE(nvl(:old.FP_TEK_COC,0)) <> PKG_LOG.GET_VALUE(nvl(:new.FP_TEK_COC,0)) then
      PKG_LOG.Do_log('TKARTA', 'FP_TEK_COC', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_TEK_COC), PKG_LOG.GET_VALUE(:new.FP_TEK_COC), :old.fk_id);
    end if;
    if UPDATING ('FK_PRIZN') AND PKG_LOG.GET_VALUE(:old.FK_PRIZN) <> PKG_LOG.GET_VALUE(:new.FK_PRIZN) then
      PKG_LOG.Do_log('TKARTA', 'FK_PRIZN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRIZN), PKG_LOG.GET_VALUE(:new.FK_PRIZN), :old.fk_id);
    end if;
    if UPDATING ('FN_SUM') AND PKG_LOG.GET_VALUE(:old.FN_SUM) <> PKG_LOG.GET_VALUE(:new.FN_SUM) then
      PKG_LOG.Do_log('TKARTA', 'FN_SUM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_SUM), PKG_LOG.GET_VALUE(:new.FN_SUM), :old.fk_id);
    end if;
    if UPDATING ('FK_PUTTYPE') AND PKG_LOG.GET_VALUE(:old.FK_PUTTYPE) <> PKG_LOG.GET_VALUE(:new.FK_PUTTYPE) then
      PKG_LOG.Do_log('TKARTA', 'FK_PUTTYPE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PUTTYPE), PKG_LOG.GET_VALUE(:new.FK_PUTTYPE), :old.fk_id);
    end if;
    if UPDATING ('FK_PACVID') AND PKG_LOG.GET_VALUE(:old.FK_PACVID) <> PKG_LOG.GET_VALUE(:new.FK_PACVID) then
      PKG_LOG.Do_log('TKARTA', 'FK_PACVID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACVID), PKG_LOG.GET_VALUE(:new.FK_PACVID), :old.fk_id);
    end if;
    if UPDATING ('FL_PAYPLACE') AND PKG_LOG.GET_VALUE(:old.FL_PAYPLACE) <> PKG_LOG.GET_VALUE(:new.FL_PAYPLACE) then
      PKG_LOG.Do_log('TKARTA', 'FL_PAYPLACE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_PAYPLACE), PKG_LOG.GET_VALUE(:new.FL_PAYPLACE), :old.fk_id);
    end if;
  end if;
  null;
END TKARTA_LOG;
/
SHOW ERRORS;


--
-- TKARTA_TO_PEOPLES$UPD  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_TO_PEOPLES$UPD" 
 AFTER
   UPDATE OF fc_docnum, fc_docser, fc_docvidan, fc_e_mail, fc_fam, fc_fax, fc_http, fc_im, fc_otch, fc_phone, fc_rabota, fd_docdate, fd_rojd, fk_docvid, fk_groupid, fp_sex
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
BEGIN
  UPDATE TPEOPLES
  SET FC_FAM = :new.fc_fam,
      FC_IM = :new.fc_im,
      FC_OTCH = :new.fc_otch,
      FP_SEX = :new.fp_sex,
      FD_ROJD = :new.fd_rojd,
      FK_DOCVID = :new.fk_docvid,
      FC_DOCSER = :new.fc_docser,
      FC_DOCNUM = :new.fc_docnum,
      FD_DOCDATE = :new.fd_docdate,
      FC_DOCVIDAN = :new.fc_docvidan,
      FC_RABOTA = :new.fc_rabota,
      FC_PHONE = :new.fc_phone,
      FC_FAX = :new.fc_fax,
      FC_E_MAIL = :new.fc_e_mail,
      FC_HTTP = :new.fc_http,
      FK_GROUPID = :new.fk_groupid
  WHERE TPEOPLES.FK_ID = :old.fk_peplid;
--  UPDATE TADRESS
--  SET fk_countryid = :new.fk_countryid,
--      fk_regionid = :new.fk_regionid,
--      fk_townid = :new.fk_townid,
--      fc_adr = :new.fc_adr
--  WHERE (TADRESS.FK_PACID = :old.fk_peplid)
--    AND (TADRESS.FK_TYPE = (select TADRTYPE.FK_ID from TADRTYPE where TADRTYPE.FL_DEFAULT = 1));
END;
/
SHOW ERRORS;


--
-- TKARTA_TO_TIB$INSERT$UPD  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_TO_TIB$INSERT$UPD" 
 AFTER
   INSERT OR UPDATE OF fk_countryid, fk_regionid, fk_townid
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
DECLARE
   CURSOR caddr IS
      SELECT /*+ rule*/ ttown.fc_name as fc_town, tregion.fc_name as fc_region, tcountry.fc_name as fc_country
        FROM ttown, tregion, tcountry
       WHERE ttown.fk_id = nvl(:new.fk_townid,1)
         AND tcountry.fk_id = nvl(:new.fk_countryid,1)
         AND tregion.fk_id = nvl(:new.fk_regionid,1);
BEGIN
--вставка в историю болезни данных эпиданамнеза
   for addr in cAddr loop
     delete from tib where fk_pacid=:old.fk_id and fk_smeditid=get_synid('EPID_PRYB_FROM');
     insert into tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
       values (:new.fk_id, addr.fc_country||' '||addr.fc_region||' '||addr.fc_town, get_synid('EPID_PRYB_FROM'),get_synid('EPID_PRYB_FROM'));
   end loop;
END;
/
SHOW ERRORS;


--
-- TKARTA_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_AFTER_DELETE" 
 AFTER
 DELETE
 ON asu.tkarta
 REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  DELETE FROM MEDSERV.TMEDSERVPERFORM t WHERE t.FK_KARTA=:OLD.FK_ID;
End;
/
SHOW ERRORS;


--
-- TKARTA_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_AFTER_UPDATE" 
 BEFORE
  UPDATE
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  :NEW.FK_SESSIONID:='-1';
End;
/
SHOW ERRORS;


--
-- TKARTA_AI_DO_CALL_STACK  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_AI_DO_CALL_STACK" 
 AFTER
  INSERT
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   var_user           VARCHAR2(30);
   var_osuser         VARCHAR2(30);
   var_machine        VARCHAR2(64);
   var_process        VARCHAR2(12);
   var_program        VARCHAR2(64);
   var_module         VARCHAR2(48);
   var_action         VARCHAR2(32);
   var_client_info    VARCHAR2(32);
BEGIN
  BEGIN
    SELECT username, osuser, machine, process, program,
           module, action,
           SUBSTR (login.get_sotrname (login.get_sotrid (
                                                         CASE regexp_substr(client_info, '[[:digit:]]*')
                                                           WHEN client_info THEN TO_NUMBER(client_info)
                                                           ELSE -1
                                                         END
                                                        )
                                      ),
                   1,
                   32
                  ) client_info
      INTO var_user, var_osuser, var_machine, var_process, var_program,
           var_module, var_action, var_client_info
      FROM SYS.v_$session s
     WHERE s.audsid = USERENV ('sessionid') AND s.SID =
                                                       (SELECT /*+ FIRST_ROWS(1)*/
                                                               SID
                                                          FROM SYS.v_$mystat
                                                         WHERE ROWNUM < 2);
  END;


  INSERT INTO asu.tkartacallstack
         VALUES (:NEW.FK_ID, SYSDATE, var_user,
                 var_osuser, var_machine, var_process, var_program,
                 var_module, var_action, var_client_info,
                 DBMS_UTILITY.format_call_stack);
END;
/
SHOW ERRORS;


--
-- TKARTA_A_DEL  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_A_DEL"
 AFTER DELETE
 ON ASU.TKARTA  REFERENCING OLD AS OLD
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
-- TKARTA_A_INS  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_A_INS"
 AFTER INSERT
 ON ASU.TKARTA  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  INSERT INTO ASU.TEXP_TPACKART(FK_PACID)
  VALUES(:NEW.FK_ID);
End;
/
SHOW ERRORS;


--
-- TKARTA_A_UPDT  (Trigger) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_A_UPDT"
 AFTER UPDATE
 ON ASU.TKARTA  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_TPACKART WHERE FK_PACID = :NEW.FK_ID;

 IF vCnt = -1979
 THEN
  INSERT INTO ASU.TEXP_TPACKART(FK_PACID)
  VALUES(:NEW.FK_ID);
 ELSE
  UPDATE ASU.TEXP_TPACKART
  SET FD_LAST_UPDATE = SYSDATE
  WHERE FK_PACID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


DROP SYNONYM BUH.TKARTA
/

--
-- TKARTA  (Synonym) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE SYNONYM BUH.TKARTA FOR ASU.TKARTA
/


DROP SYNONYM FOOD.TS_REGISTR_PEOPLE
/

--
-- TS_REGISTR_PEOPLE  (Synonym) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE SYNONYM FOOD.TS_REGISTR_PEOPLE FOR ASU.TKARTA
/


DROP SYNONYM MED.TKARTA
/

--
-- TKARTA  (Synonym) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE SYNONYM MED.TKARTA FOR ASU.TKARTA
/


DROP SYNONYM STAT.TKARTA
/

--
-- TKARTA  (Synonym) 
--
--  Dependencies: 
--   TKARTA (Table)
--
CREATE SYNONYM STAT.TKARTA FOR ASU.TKARTA
/


-- 
-- Non Foreign Key Constraints for Table TKARTA 
-- 
ALTER TABLE ASU.TKARTA ADD (
  CONSTRAINT TKARTA_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          384K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, UPDATE ON ASU.TKARTA TO BUH
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TKARTA TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TKARTA TO EXCH43
/

GRANT SELECT ON ASU.TKARTA TO MED
/

