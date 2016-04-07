ALTER TABLE ASU.TINSURDOCS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINSURDOCS CASCADE CONSTRAINTS
/

--
-- TINSURDOCS  (Table) 
--
CREATE TABLE ASU.TINSURDOCS
(
  FK_ID           NUMBER                        NOT NULL,
  FK_PEPLID       NUMBER,
  FK_GROUPID      NUMBER                        DEFAULT 0,
  FK_DOGOVORID    NUMBER,
  FK_TYPEDOCID    NUMBER                        DEFAULT 0,
  FC_SER          VARCHAR2(100 BYTE),
  FD_BEGIN        DATE,
  FD_END          DATE,
  FC_NUM          VARCHAR2(100 BYTE),
  FK_COMPANYID    NUMBER,
  FD_PROLONG      DATE,
  FK_TYPEOMS      NUMBER,
  FD_NULL         DATE,
  FC_ENP          VARCHAR2(100 BYTE),
  FK_STRAHID      NUMBER,
  FC_INSSUM       NUMBER,
  FD_LAST_CHANGE  DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          14696K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_ID IS 'SEQUENCE=[SEQ_TINSURDOCS]'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_PEPLID IS 'TPEOPLES.FK_ID Код человека'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_GROUPID IS 'TGROUPS.FK_ID Код группы (таблицы пока нет)'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_DOGOVORID IS 'TDOGOVOR.FK_ID Код договора (не используется)'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_TYPEDOCID IS 'TTYPEDOC.FK_ID Код типа документа  (таблицы пока нет) 1 - полис, 2 - Удостоверение личности'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FC_SER IS 'Серия полиса'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FD_BEGIN IS 'Начало срока действия полиса'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FD_END IS 'Окончание срока действия полиса'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FC_NUM IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_COMPANYID IS 'TCOMPANY.FK_ID код страховой компании'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FD_PROLONG IS 'Окончание срока временного действия полиса'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_TYPEOMS IS 'TSMID.FK_ID подтип полиса ОМС'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FK_STRAHID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TINSURDOCS.FD_LAST_CHANGE IS 'Дата последнего изменения kulikovskiy e.v.'
/


--
-- FK_TYPEDOCID_FK_ID  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE UNIQUE INDEX ASU.FK_TYPEDOCID_FK_ID ON ASU.TINSURDOCS
(FK_TYPEDOCID, FK_ID)
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
-- TINSURDOCS_BY_DOGOVOR  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_DOGOVOR ON ASU.TINSURDOCS
(FK_DOGOVORID)
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
-- TINSURDOCS_BY_ENP  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_ENP ON ASU.TINSURDOCS
(FC_ENP)
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
-- TINSURDOCS_BY_FD_BEG  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_FD_BEG ON ASU.TINSURDOCS
(FD_BEGIN)
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
-- TINSURDOCS_BY_FD_END_PROLONG  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_FD_END_PROLONG ON ASU.TINSURDOCS
(FD_END, FD_PROLONG)
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
-- TINSURDOCS_BY_FD_LCH  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_FD_LCH ON ASU.TINSURDOCS
(FD_LAST_CHANGE)
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
-- TINSURDOCS_BY_ID  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE UNIQUE INDEX ASU.TINSURDOCS_BY_ID ON ASU.TINSURDOCS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3840K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TINSURDOCS_BYPACID  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BYPACID ON ASU.TINSURDOCS
(FK_PEPLID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          7552K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TINSURDOCS_BY_PEPLID  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_PEPLID ON ASU.TINSURDOCS
(FK_PEPLID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5712K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TINSURDOCS_BYSERANDNUM  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BYSERANDNUM ON ASU.TINSURDOCS
(TRIM("FC_SER"||"FC_NUM"), FK_COMPANYID)
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
-- TINSURDOCS_BY_SERNUM  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BY_SERNUM ON ASU.TINSURDOCS
(FC_SER, FC_NUM, FK_COMPANYID)
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
-- TINSURDOCS_BYUPPERSERANDNUM  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS_BYUPPERSERANDNUM ON ASU.TINSURDOCS
(UPPER(TRIM("FC_SER"||"FC_NUM")))
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
-- TINSURDOCS$FK_TYPEDOCID  (Index) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE INDEX ASU.TINSURDOCS$FK_TYPEDOCID ON ASU.TINSURDOCS
(FK_TYPEDOCID)
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
-- TINSURDOCS_MESSAGE  (Trigger) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_MESSAGE" 
 AFTER 
 DELETE OR UPDATE
 ON ASU.TINSURDOCS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
CURSOR C1 is
    SELECT   fk_userid, DECODE (COUNT (fk_userid), 0, 0, 1) AS fp_support
                      FROM ASU.tmisexch_tasks_users
                  GROUP BY fk_userid;
CURSOR C2 is
    SELECT OSUSER, MACHINE, MODULE --, TERMINAL, MODULE, ACTION, CLIENT_INFO, LOGON_TIME, PROCESS
          FROM V$SESSION
         WHERE AUDSID = USERENV('SESSIONID');
    nRes NUMBER;
    sOSUSER VARCHAR2(50);
    sMACHINE VARCHAR2(100);
    sMODULE VARCHAR2(100);
    sOld VARCHAR(100);
    sNew VARCHAR(100);
    sPacFIO VARCHAR(100);
    sTextMSG VARCHAR2(4000);
BEGIN

  IF UPDATING('FK_TYPEDOCID') and  :OLD.FK_TYPEDOCID<>:NEW.FK_TYPEDOCID THEN
    OPEN C2;
    FETCH C2 into sOSUSER, sMACHINE, sMODULE;
    CLOSE C2;

    FOR C3 in (select FC_NAME from  TTYPEDOC where FK_ID = :OLD.FK_TYPEDOCID)
    LOOP
        sOld:=sOld||C3.FC_NAME||' ';
    END LOOP;
    FOR C4 in (select FC_NAME into sNew from  TTYPEDOC where FK_ID = :NEW.FK_TYPEDOCID)
    LOOP
        sNew:=sNew||C4.FC_NAME||' ';
    END LOOP;

    sPacFIO:=GET_PEOPLE_FIO(:OLD.FK_PEPLID);

    sTextMSG:='Внимание! Произведено изменение типа страхового документа у пациента "'|| sPacFIO
                || '"  с ' || sOld ||' ('|| :OLD.FK_TYPEDOCID || ')  на '|| sNew||' (' || :NEW.FK_TYPEDOCID||') '
                ||'   пользователем "'||sOSUSER||'"  на компьютере "'||sMACHINE||'"' || '  в модуле "'||sModule||'". TINSURDOCS.fk_id = ' ||:NEW.FK_ID;

    FOR C in C1
    LOOP
        InsMSG(C.fk_userid,sTextMSG);
    END LOOP;
  END IF;
END;
/
SHOW ERRORS;


--
-- TINSURDOCS_LOG  (Trigger) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_LOG" 
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON ASU.TINSURDOCS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TINSURDOCS', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_PEPLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PEPLID), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_GROUPID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_GROUPID), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_DOGOVORID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOGOVORID), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_TYPEDOCID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_TYPEDOCID), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FC_SER', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_SER), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FC_NUM', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FC_NUM), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_BEGIN', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_BEGIN), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_END', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_END), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_COMPANYID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_COMPANYID), :new.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_PROLONG', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_PROLONG), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TINSURDOCS', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_PEPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FC_SER', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_SER), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FC_NUM', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NUM), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_BEGIN', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_BEGIN), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_END', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_END), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_COMPANYID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_COMPANYID), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_GROUPID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_DOGOVORID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOGOVORID), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FK_TYPEDOCID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_TYPEDOCID), null, :old.fk_id);
    PKG_LOG.Do_log('TINSURDOCS', 'FD_PROLONG', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_PROLONG), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TINSURDOCS', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_PEPLID') AND PKG_LOG.GET_VALUE(:old.FK_PEPLID) <> PKG_LOG.GET_VALUE(NVL(:new.FK_PEPLID,0)) then
      PKG_LOG.Do_log('TINSURDOCS', 'FK_PEPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PEPLID), PKG_LOG.GET_VALUE(:new.FK_PEPLID), :old.fk_id);
    end if;
    if UPDATING ('FC_SER') AND PKG_LOG.GET_VALUE(:old.FC_SER) <> PKG_LOG.GET_VALUE(:new.FC_SER) then
      PKG_LOG.Do_log('TINSURDOCS', 'FC_SER', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_SER), PKG_LOG.GET_VALUE(:new.FC_SER), :old.fk_id);
    end if;
    if UPDATING ('FC_NUM') AND PKG_LOG.GET_VALUE(:old.FC_NUM) <> PKG_LOG.GET_VALUE(:new.FC_NUM) then
      PKG_LOG.Do_log('TINSURDOCS', 'FC_NUM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NUM), PKG_LOG.GET_VALUE(:new.FC_NUM), :old.fk_id);
    end if;
    if UPDATING ('FD_BEGIN') AND PKG_LOG.GET_VALUE(:old.FD_BEGIN) <> PKG_LOG.GET_VALUE(:new.FD_BEGIN) then
      PKG_LOG.Do_log('TINSURDOCS', 'FD_BEGIN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_BEGIN), PKG_LOG.GET_VALUE(:new.FD_BEGIN), :old.fk_id);
    end if;
    if UPDATING ('FD_END') AND PKG_LOG.GET_VALUE(:old.FD_END) <> PKG_LOG.GET_VALUE(:new.FD_END) then
      PKG_LOG.Do_log('TINSURDOCS', 'FD_END', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_END), PKG_LOG.GET_VALUE(:new.FD_END), :old.fk_id);
    end if;
    if UPDATING ('FD_PROLONG') AND PKG_LOG.GET_VALUE(:old.FD_PROLONG) <> PKG_LOG.GET_VALUE(:new.FD_PROLONG) then
      PKG_LOG.Do_log('TINSURDOCS', 'FD_PROLONG', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_PROLONG), PKG_LOG.GET_VALUE(:new.FD_PROLONG), :old.fk_id);
    end if;
    if UPDATING ('FK_COMPANYID') AND PKG_LOG.GET_VALUE(:old.FK_COMPANYID) <> PKG_LOG.GET_VALUE(NVL(:new.FK_COMPANYID,0)) then
      PKG_LOG.Do_log('TINSURDOCS', 'FK_COMPANYID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_COMPANYID), PKG_LOG.GET_VALUE(:new.FK_COMPANYID), :old.fk_id);
    end if;


    if UPDATING ('FK_GROUPID') AND PKG_LOG.GET_VALUE(:old.FK_GROUPID) <> PKG_LOG.GET_VALUE(NVL(:new.FK_GROUPID,0)) then
      PKG_LOG.Do_log('TINSURDOCS', 'FK_GROUPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_GROUPID), PKG_LOG.GET_VALUE(:new.FK_GROUPID), :old.fk_id);
    end if;
    if UPDATING ('FK_DOGOVORID') AND PKG_LOG.GET_VALUE(:old.FK_DOGOVORID) <> PKG_LOG.GET_VALUE(NVL(:new.FK_DOGOVORID,0)) then
      PKG_LOG.Do_log('TINSURDOCS', 'FK_DOGOVORID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOGOVORID), PKG_LOG.GET_VALUE(:new.FK_DOGOVORID), :old.fk_id);
    end if;
    if UPDATING ('FK_TYPEDOCID') AND PKG_LOG.GET_VALUE(:old.FK_TYPEDOCID) <> PKG_LOG.GET_VALUE(NVL(:new.FK_TYPEDOCID,0)) then
      PKG_LOG.Do_log('TINSURDOCS', 'FK_TYPEDOCID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_TYPEDOCID), PKG_LOG.GET_VALUE(:new.FK_TYPEDOCID), :old.fk_id);
    end if;
    if UPDATING ('FD_PROLONG') AND PKG_LOG.GET_VALUE(:old.FD_PROLONG) <> PKG_LOG.GET_VALUE(:new.FD_PROLONG) then
      PKG_LOG.Do_log('TINSURDOCS', 'FD_PROLONG', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_PROLONG), PKG_LOG.GET_VALUE(:new.FD_PROLONG), :old.fk_id);
    end if;
  end if;
  null;
END;
/
SHOW ERRORS;


--
-- TINSURDOCS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TINSURDOCS REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  select seq_TINSURDOCS.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TINSURDOCS_AFTER_INS_UPD_DEL  (Trigger) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_AFTER_INS_UPD_DEL" 
 AFTER
  INSERT OR DELETE OR UPDATE
 ON asu.tinsurdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
    FOR c in (select count(0) n from asu.ttypedoc where ttypedoc.fl_notdoc = 1 and (:new.FK_TYPEDOCID=ttypedoc.FK_ID or :old.FK_TYPEDOCID=ttypedoc.FK_ID))
    LOOP
        if c.n > 0 then
            if INSERTING then
                insert into asu.tinsurnotdocs values (0, :new.fk_id, :new.FK_TYPEDOCID);
            elsif UPDATING then
                update asu.tinsurnotdocs set fk_typeDoc=:new.FK_TYPEDOCID where fk_insurID=:new.fk_id;
            elsif DELETING then
                delete from asu.tinsurnotdocs where fk_insurID=:old.fk_id;
            end if;
        end if;
    END LOOP;
END;
/
SHOW ERRORS;


--
-- TINSURDOCS_BI_FD_LCH  (Trigger) 
--
--  Dependencies: 
--   TINSURDOCS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINSURDOCS_BI_FD_LCH" 
    BEFORE INSERT
    ON ASU.TINSURDOCS     REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
Begin
      select sysdate into :new.FD_LAST_CHANGE from dual;
    End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINSURDOCS 
-- 
ALTER TABLE ASU.TINSURDOCS ADD (
  CONSTRAINT TINSURDOCS_PK
 PRIMARY KEY
 (FK_ID))
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TINSURDOCS TO EXCHANGE
/

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TINSURDOCS TO EXCH43
/

