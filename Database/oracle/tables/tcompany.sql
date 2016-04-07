ALTER TABLE ASU.TCOMPANY
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCOMPANY CASCADE CONSTRAINTS
/

--
-- TCOMPANY  (Table) 
--
CREATE TABLE ASU.TCOMPANY
(
  FK_ID            NUMBER(15)                   DEFAULT 0                     NOT NULL,
  FC_NAME          VARCHAR2(100 BYTE),
  FC_SHORT         VARCHAR2(255 BYTE),
  FK_COUNTRYID     NUMBER(15)                   DEFAULT 0,
  FK_REGIONID      NUMBER(15)                   DEFAULT 0,
  FK_TOWNID        NUMBER(15)                   DEFAULT 0,
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
  FL_DEL           NUMBER                       DEFAULT 0,
  FK_GUID          VARCHAR2(32 BYTE)            DEFAULT sys_guid(),
  FN_TRANSFUS_NUM  VARCHAR2(20 BYTE),
  FL_ISTRANSFUS    NUMBER,
  FC_OGRN          VARCHAR2(13 BYTE),
  FC_KPP           VARCHAR2(9 BYTE),
  FC_ACCOUNT       VARCHAR2(100 BYTE),
  FC_BIK           VARCHAR2(9 BYTE),
  FC_COMMENT       VARCHAR2(255 BYTE),
  FD_OPEN          DATE,
  FD_CLOSE         DATE,
  FC_DMS_CONTRACT  VARCHAR2(30 BYTE),
  FC_INDEX         VARCHAR2(20 BYTE),
  FC_ADR_PLAT      VARCHAR2(200 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TCOMPANY IS 'Справочник "Организации" by TimurLan '
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_ID IS 'SEQUENCE=[SEQ_TCOMPANY]'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_SHORT IS 'кратко'
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_COUNTRYID IS 'TCOUNTRY.FK_ID'
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_REGIONID IS 'TREGION.FK_ID'
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_TOWNID IS 'TTOWN.FK_ID'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_ADR IS 'адрес'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_FAX IS 'факс'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_TEL IS 'телефон'
/

COMMENT ON COLUMN ASU.TCOMPANY.OLDID IS 'служебные данные'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_OKONH IS 'код ОКОНХ'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_OKPO IS 'код ОКПО'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_INN IS 'код ИНН'
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_INSURCOMPID IS 'Код страховой компании'
/

COMMENT ON COLUMN ASU.TCOMPANY.FK_OWNER IS 'Ссылка на родителя - FK_ID'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_SYNONIM IS 'Синоним'
/

COMMENT ON COLUMN ASU.TCOMPANY.FL_DEL IS 'Признак удаления'
/

COMMENT ON COLUMN ASU.TCOMPANY.FN_TRANSFUS_NUM IS 'Двузначный код для службы трансфузиологии'
/

COMMENT ON COLUMN ASU.TCOMPANY.FL_ISTRANSFUS IS 'Организация участвует в трансфузиологии? 1 - да, null - нет'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_OGRN IS 'ОГРН'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_KPP IS 'КПП'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_ACCOUNT IS 'Расчётный счёт'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_BIK IS 'БИК'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_COMMENT IS 'Дополнительная информация'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_DMS_CONTRACT IS 'Договор ДМС'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_INDEX IS 'Почтовый индекс'
/

COMMENT ON COLUMN ASU.TCOMPANY.FC_ADR_PLAT IS 'Адрес для плательщика св счетах-фактурах'
/


--
-- IDX_TCOMPANY_GUID  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TCOMPANY_GUID ON ASU.TCOMPANY
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
-- IDX_TCOMPANY_SYNC  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE INDEX ASU.IDX_TCOMPANY_SYNC ON ASU.TCOMPANY
(FC_NAME, FK_OWNER)
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
-- TCOMPANY_BY_ID  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE UNIQUE INDEX ASU.TCOMPANY_BY_ID ON ASU.TCOMPANY
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TCOMPANY$FC_SHORT  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE INDEX ASU.TCOMPANY$FC_SHORT ON ASU.TCOMPANY
(FC_SHORT)
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
-- TCOMPANY$FK_OWNER  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE INDEX ASU.TCOMPANY$FK_OWNER ON ASU.TCOMPANY
(FK_OWNER)
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
PARALLEL ( DEGREE DEFAULT INSTANCES DEFAULT )
/


--
-- TCOMPANY_SYN  (Index) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE UNIQUE INDEX ASU.TCOMPANY_SYN ON ASU.TCOMPANY
(FC_SYNONIM)
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
-- TCOMPANY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOMPANY_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TCOMPANY REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TCOMPANY.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TR_TCOMPANY  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TCOMPANY" 
     AFTER INSERT OR UPDATE OR DELETE ON tcompany FOR EACH ROW
declare
     vID  number;
     vStr varchar2(2000);
     vtcountryfk_countryid varchar(32);
       vtregionfk_regionid varchar(32);
       vttownfk_townid varchar(32);
       vtcompanyfk_owner varchar(32);
       vtcompanyfk_insurcompid varchar(32);
      
   begin
     if (PKG_sync.v_is_repl = 0) and pkg_sync.get_company(nvl(:new.fk_owner, :old.fk_owner)) then     
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vtcountryfk_countryid from asu.tcountry t where t.fk_id = :new.fk_countryid;
         exception when others then
           vtcountryfk_countryid := null;
         end;
        begin
          select t.fk_guid into  vtregionfk_regionid from asu.tregion t where t.fk_id = :new.fk_regionid;
         exception when others then
           vtregionfk_regionid := null;
         end;
        begin
          select t.fk_guid into  vttownfk_townid from asu.ttown t where t.fk_id = :new.fk_townid;
         exception when others then
           vttownfk_townid := null;
         end;
        begin
           vtcompanyfk_owner := pkg_sync.GetGuidByID(:new.FK_OWNER,'TCOMPANY');
         exception when others then
           vtcompanyfk_owner := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_insurcompid from asu.tcompany t where t.fk_id = :new.fk_insurcompid;
         exception when others then
           vtcompanyfk_insurcompid := null;
         end;
       
         insert into tcompany_s (FK_ID,FL_ISTRANSFUS,FK_GUID,FN_TRANSFUS_NUM,FC_NAME,FC_SHORT,FC_ADR,FC_FAX,FC_TEL,OLDID,FC_OKONH,FC_OKPO,FC_INN,FC_SYNONIM,FL_DEL,fk_countryidg,fk_regionidg,fk_townidg,fk_ownerg,fk_insurcompidg,fd_edittime)
              values (0,:new.FL_ISTRANSFUS,:new.FK_GUID,:new.FN_TRANSFUS_NUM,:new.FC_NAME,:new.FC_SHORT,:new.FC_ADR,:new.FC_FAX,:new.FC_TEL,:new.OLDID,:new.FC_OKONH,:new.FC_OKPO,:new.FC_INN,:new.FC_SYNONIM,:new.FL_DEL,vtcountryfk_countryid,vtregionfk_regionid,vttownfk_townid,vtcompanyfk_owner,vtcompanyfk_insurcompid,systimestamp);
       elsif DELETING then
         insert into tcompany_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vtcountryfk_countryid from asu.tcountry t where t.fk_id = :new.fk_countryid;
         exception when others then
           vtcountryfk_countryid := null;
         end;
        begin
          select t.fk_guid into  vtregionfk_regionid from asu.tregion t where t.fk_id = :new.fk_regionid;
         exception when others then
           vtregionfk_regionid := null;
         end;
        begin
          select t.fk_guid into  vttownfk_townid from asu.ttown t where t.fk_id = :new.fk_townid;
         exception when others then
           vttownfk_townid := null;
         end;
        begin
--          select t.fk_guid into  vtcompanyfk_owner from asu.tcompany t where t.fk_id = :new.fk_owner;
           vtcompanyfk_owner := pkg_sync.GetGuidByID(:new.FK_OWNER,'TCOMPANY');
         exception when others then
           vtcompanyfk_owner := null;
         end;
        begin
          select t.fk_guid into  vtcompanyfk_insurcompid from asu.tcompany t where t.fk_id = :new.fk_insurcompid;
         exception when others then
           vtcompanyfk_insurcompid := null;
         end;
       
         insert into tcompany_s (FK_ID,FL_ISTRANSFUS,FK_GUID,FN_TRANSFUS_NUM,FC_NAME,FC_SHORT,FC_ADR,FC_FAX,FC_TEL,OLDID,FC_OKONH,FC_OKPO,FC_INN,FC_SYNONIM,FL_DEL,fk_countryidg,fk_regionidg,fk_townidg,fk_ownerg,fk_insurcompidg,fd_edittime)
              values (2,:new.FL_ISTRANSFUS,:new.FK_GUID,:new.FN_TRANSFUS_NUM,:new.FC_NAME,:new.FC_SHORT,:new.FC_ADR,:new.FC_FAX,:new.FC_TEL,:new.OLDID,:new.FC_OKONH,:new.FC_OKPO,:new.FC_INN,:new.FC_SYNONIM,:new.FL_DEL,vtcountryfk_countryid,vtregionfk_regionid,vttownfk_townid,vtcompanyfk_owner,vtcompanyfk_insurcompid,systimestamp);
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
-- TCOMPANY_LOG  (Trigger) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCOMPANY_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON asu.TCOMPANY
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
--DECLARE
--  nTemp NUMBER;
BEGIN
  if INSERTING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'INSERT',
                       null,
                       asu.PKG_LOG.GET_VALUE(:new.fk_id),
                       :new.fk_id);
  elsif DELETING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'DELETE',
                       asu.PKG_LOG.GET_VALUE(:old.fk_id),
                       null,
                       :old.fk_id);
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FC_NAME',
                       'DELETE',
                       asu.PKG_LOG.GET_VALUE(:old.FC_NAME),
                       null,
                       :old.fk_id);
  elsif UPDATING then
    asu.PKG_LOG.Do_log('TCOMPANY',
                       'FK_ID',
                       'UPDATE',
                       asu.PKG_LOG.GET_VALUE(:old.fk_id),
                       asu.PKG_LOG.GET_VALUE(:new.fk_id),
                       :old.fk_id);
    if UPDATING('FC_NAME') AND asu.PKG_LOG.GET_VALUE(:old.FC_NAME) <>
       asu.PKG_LOG.GET_VALUE(:new.FC_NAME) then
      asu.PKG_LOG.Do_log('TCOMPANY',
                         'FC_NAME',
                         'UPDATE',
                         asu.PKG_LOG.GET_VALUE(:old.FC_NAME),
                         asu.PKG_LOG.GET_VALUE(:new.FC_NAME),
                         :old.fk_id);
    end if;
    -- Begin Added 10091015 by Linnikov
    if asu.PKG_LOG.GET_VALUE(:old.FK_OWNER) <>
       asu.PKG_LOG.GET_VALUE(:new.FK_OWNER) then
      asu.PKG_LOG.Do_log('TCOMPANY',
                         'FK_OWNER',
                         'UPDATE',
                         asu.PKG_LOG.GET_VALUE(:old.FK_OWNER),
                         asu.PKG_LOG.GET_VALUE(:new.FK_OWNER),
                         :old.fk_id);
    end if;
    -- End Added 10091015 by Linnikov
    null;
  end if;
END;
/
SHOW ERRORS;


DROP SYNONYM BUH.TCOMPANY
/

--
-- TCOMPANY  (Synonym) 
--
--  Dependencies: 
--   TCOMPANY (Table)
--
CREATE SYNONYM BUH.TCOMPANY FOR ASU.TCOMPANY
/


-- 
-- Non Foreign Key Constraints for Table TCOMPANY 
-- 
ALTER TABLE ASU.TCOMPANY ADD (
  CONSTRAINT TCOMPANY_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ),
  CONSTRAINT TCOMPANY_SYN
 UNIQUE (FC_SYNONIM)
    USING INDEX 
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
               ))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TCOMPANY TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TCOMPANY TO EXCH43
/

