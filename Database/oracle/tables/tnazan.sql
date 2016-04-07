ALTER TABLE ASU.TNAZAN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZAN CASCADE CONSTRAINTS
/

--
-- TNAZAN  (Table) 
--
CREATE TABLE ASU.TNAZAN
(
  FK_ID           NUMBER(15)                    NOT NULL,
  FK_SMID         NUMBER(15),
  FC_REMARK       VARCHAR2(4000 BYTE),
  FD_NAZ          DATE,
  FD_RUN          DATE,
  FK_ROOMID       NUMBER(9)                     DEFAULT 0,
  FK_ISPOLID      NUMBER(15)                    DEFAULT 0,
  FK_VRACHID      NUMBER(15),
  FK_NAZSOSID     NUMBER(15),
  FK_PACID        NUMBER(15),
  FK_RESULTID     NUMBER(15)                    DEFAULT -1,
  FC_NAME         VARCHAR2(100 BYTE),
  FL_PLAT         VARCHAR2(3 BYTE),
  FC_TYPE         VARCHAR2(20 BYTE),
  FL_INS          NUMBER(1),
  FL_IN_RASPIS    NUMBER(1)                     DEFAULT 0,
  FK_RAZDID       NUMBER(9)                     DEFAULT -1,
  FL_ISVRACHVIEW  NUMBER(1),
  FL_MORE_PUT     NUMBER(1)                     DEFAULT 0,
  FK_DOCID        NUMBER(15),
  FK_NAZTYPEID    NUMBER(15),
  FK_NAZOWNER     NUMBER(15)                    DEFAULT -1,
  FK_NAZCAUSEID   NUMBER,
  FK_GUID         VARCHAR2(32 BYTE),
  FK_TYPEDOC      NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          14600K
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

COMMENT ON TABLE ASU.TNAZAN IS 'Данные о назначениях на лабораторные исследования'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_SMID IS 'Код проводимого исследования'
/

COMMENT ON COLUMN ASU.TNAZAN.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TNAZAN.FD_NAZ IS 'Дата назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FD_RUN IS 'Дата регистрации/проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_VRACHID IS 'Код врача, проводившего исследования'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_NAZSOSID IS 'Состояние назначения(по справочнику TNAZSOS)'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_RESULTID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZAN.FC_NAME IS 'Название назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FL_PLAT IS 'Признак необходимости оплаты назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FC_TYPE IS 'Тип назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FL_INS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZAN.FL_IN_RASPIS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_RAZDID IS 'Оправданная денормализация, по FK_SMID получает его раздел, в триггере TNAZAN_SET_RAZDID'
/

COMMENT ON COLUMN ASU.TNAZAN.FL_ISVRACHVIEW IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZAN.FL_MORE_PUT IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_NAZOWNER IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TNAZAN.FK_NAZCAUSEID IS 'Код причины отказа'
/


--
-- TNAZAN_ALL  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_ALL ON ASU.TNAZAN
(FK_ID, FD_RUN, FK_ROOMID, FK_ISPOLID, FK_NAZSOSID, 
FK_PACID, FL_IN_RASPIS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          10368K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_BY_DATA_PACID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE UNIQUE INDEX ASU.TNAZAN_BY_DATA_PACID ON ASU.TNAZAN
(FK_PACID, FD_RUN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6528K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_BY_ID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_BY_ID ON ASU.TNAZAN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2688K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_BY_ID_NAZSOSID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE UNIQUE INDEX ASU.TNAZAN_BY_ID_NAZSOSID ON ASU.TNAZAN
(FK_ID, FK_NAZSOSID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4736K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_BY_NAZOWNER  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_BY_NAZOWNER ON ASU.TNAZAN
(FK_NAZOWNER)
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
-- TNAZAN_BY_NAZSOSID_FDRUN  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_BY_NAZSOSID_FDRUN ON ASU.TNAZAN
(FK_NAZSOSID, FD_RUN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          6016K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_BY_PACID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_BY_PACID ON ASU.TNAZAN
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3584K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_DATE  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_DATE ON ASU.TNAZAN
(FD_RUN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4608K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_FK_NAZSOS_PACID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE UNIQUE INDEX ASU.TNAZAN_FK_NAZSOS_PACID ON ASU.TNAZAN
(FK_NAZSOSID, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5632K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_SMID_INS  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_SMID_INS ON ASU.TNAZAN
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_SOS_RASPIS  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_SOS_RASPIS ON ASU.TNAZAN
(FK_NAZSOSID, FL_IN_RASPIS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4352K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZAN_SOS_VRACHID  (Index) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE INDEX ASU.TNAZAN_SOS_VRACHID ON ASU.TNAZAN
(FK_VRACHID, FD_NAZ)
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
-- TR_TNAZAN  (Trigger) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TNAZAN" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TNAZAN FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vTNAZSOSFK_NAZSOSID varchar(32);
       vTAMBULANCEFK_PACID varchar(32);
       vTSMIDFK_NAZTYPEID varchar(32);
       vVNAZFK_NAZOWNER varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_id = :new.FK_NAZSOSID;
         exception when others then
           vTNAZSOSFK_NAZSOSID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_id = :new.FK_NAZTYPEID;
         exception when others then
           vTSMIDFK_NAZTYPEID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_id = :new.FK_NAZOWNER;
         exception when others then
           vVNAZFK_NAZOWNER := null;
         end;
       
         insert into TNAZAN_s (FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMIDg,FK_NAZSOSIDg,FK_PACIDg,FK_NAZTYPEIDg,FK_NAZOWNERg,fd_edittime)
              values (0,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER,systimestamp);
       elsif DELETING then
         insert into TNAZAN_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_NAZSOSID from asu.TNAZSOS t where t.fk_id = :new.FK_NAZSOSID;
         exception when others then
           vTNAZSOSFK_NAZSOSID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_NAZTYPEID from asu.TSMID t where t.fk_id = :new.FK_NAZTYPEID;
         exception when others then
           vTSMIDFK_NAZTYPEID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZOWNER from asu.tnazan t where t.fk_id = :new.FK_NAZOWNER;
         exception when others then
           vVNAZFK_NAZOWNER := null;
         end;
       
         insert into TNAZAN_s (FK_ID,FK_GUID,FC_REMARK,FD_NAZ,FD_RUN,FK_ROOMID,FK_ISPOLID,FK_VRACHID,FK_RESULTID,FC_NAME,FL_PLAT,FC_TYPE,FL_INS,FL_IN_RASPIS,FK_RAZDID,FL_ISVRACHVIEW,FL_MORE_PUT,FK_DOCID,FK_NAZCAUSEID,FK_SMIDg,FK_NAZSOSIDg,FK_PACIDg,FK_NAZTYPEIDg,FK_NAZOWNERg,fd_edittime)
              values (2,:new.FK_GUID,:new.FC_REMARK,:new.FD_NAZ,:new.FD_RUN,:new.FK_ROOMID,:new.FK_ISPOLID,:new.FK_VRACHID,:new.FK_RESULTID,:new.FC_NAME,:new.FL_PLAT,:new.FC_TYPE,:new.FL_INS,:new.FL_IN_RASPIS,:new.FK_RAZDID,:new.FL_ISVRACHVIEW,:new.FL_MORE_PUT,:new.FK_DOCID,:new.FK_NAZCAUSEID,vTSMIDFK_SMID,vTNAZSOSFK_NAZSOSID,vTAMBULANCEFK_PACID,vTSMIDFK_NAZTYPEID,vVNAZFK_NAZOWNER,systimestamp);
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
-- TNAZAN_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_DELETE" 
 AFTER
 DELETE
 ON asu.TNAZAN
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  DELETE FROM TIB WHERE FK_PACID = :OLD.FK_ID;
  DELETE FROM TRESIS WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TEXPAN WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TLABREG WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM TNAZGROUP WHERE FK_NAZID = :OLD.FK_ID;

  if insnaz.bins then
    return;
  end if;
  insnaz.bins := true;
  asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
  DELETE FROM TRESAN WHERE FK_NAZID = :OLD.FK_ID;
  DELETE FROM VNAZ WHERE FK_ID = :OLD.FK_ID;

  insnaz.bins := false;
exception
  when others then
    insnaz.bins := false;
End;
/
SHOW ERRORS;


--
-- TNAZAN_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_INSERT" 
 BEFORE
 INSERT
 ON ASU.TNAZAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
omsId NUMBER;
BEGIN
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/

 if insnaz.bins then
   return;
 end if;
  insnaz.bins:=true;
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

  for p in (SELECT FK_ID FK_SMID FROM TSMID WHERE FL_SHOWANAL <> 5 AND FC_TYPE <> 'COLUMNS' AND FL_DEL = 0 START WITH FK_OWNER = :NEW.FK_SMID CONNECT BY PRIOR FK_ID = FK_OWNER) loop
    INSERT INTO TEXPAN (FK_NAZID, FK_SMID) VALUES (:NEW.FK_ID, p.FK_SMID);
  end loop;-- << by TimurLan 05/10/06

  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview, pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  else
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview, :new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  end if;

  insert into tnazgroup(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
    values(:new.FK_ID, GET_GROUPID_BY_SMID(:new.FK_SMID), :new.FD_RUN, :new.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :new.FD_RUN);

  -- Reference from TNAZAN to TNAZOPL
  SELECT FK_ID into omsId FROM TSMID WHERE FC_SYNONIM = 'TAL_OPLOMS';
  INSERT INTO TNAZOPL (FK_NAZID, FK_SMID_TAL_OPL) VALUES (:new.FK_ID, omsId);

  insnaz.bins:=false;


  exception
    when others then
        insnaz.bins:=false;
END;
/
SHOW ERRORS;


--
-- TNAZAN_SET_RAZDID  (Trigger) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_SET_RAZDID" 
BEFORE INSERT OR UPDATE
ON ASU.TNAZAN REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  :NEW.FK_RAZDID:=GET_LAB_RAZD(:NEW.FK_SMID);
End;
/
SHOW ERRORS;


--
-- TNAZAN_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZAN_UPDATE" 
 BEFORE
 UPDATE
 ON ASU.TNAZAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
  if UPDATING ('FK_NAZSOSID') AND :old.FK_NAZSOSID <> :new.FK_NAZSOSID then
    UPDATE TPLAT_USLUG SET FP_SOS = :new.FK_NAZSOSID WHERE FK_NAZ = :new.fk_id;
    if :new.FK_NAZSOSID = GET_VIPNAZ then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 0, FL_AGREED = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
    if :new.FK_NAZSOSID = GET_NEVIP then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
  end if;

  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
      UPDATE vnaz
         SET fk_smid = :new.fk_smid,fc_remark = :new.fc_remark,fd_naz = :new.fd_naz,fd_run = :new.fd_run,fk_roomid = :new.fk_roomid,
             fk_ispolid = :new.fk_ispolid,fk_vrachid = :new.fk_vrachid,fk_nazsosid = :new.fk_nazsosid,fk_pacid = :new.fk_pacid,
             fk_resultid = :new.fk_resultid,fc_name = :new.fc_name,fl_plat = :new.fl_plat,fc_type = :new.fc_type,
             fl_in_raspis = :new.fl_in_raspis,fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put,
             FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
       WHERE fk_id = :old.fk_id;
      UPDATE TNAZGROUP
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, fd_date = :new.fd_run

       WHERE FK_NAZID = :old.fk_id;
       if (:old.FK_NAZSOSID = :new.FK_NAZSOSID) and (:old.fd_run <> :new.fd_run) then
          UPDATE TNAZGROUP
          SET fd_run = :new.fd_run
          WHERE FK_NAZID = :old.fk_id;
       end if;
  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise_application_error(SQLCODE, SQLERRM);
end;
/
SHOW ERRORS;


DROP SYNONYM BUH.TNAZAN
/

--
-- TNAZAN  (Synonym) 
--
--  Dependencies: 
--   TNAZAN (Table)
--
CREATE SYNONYM BUH.TNAZAN FOR ASU.TNAZAN
/


-- 
-- Non Foreign Key Constraints for Table TNAZAN 
-- 
ALTER TABLE ASU.TNAZAN ADD (
  CONSTRAINT TNAZAN_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          2688K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

