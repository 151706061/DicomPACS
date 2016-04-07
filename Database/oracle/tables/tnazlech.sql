ALTER TABLE ASU.TNAZLECH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZLECH CASCADE CONSTRAINTS
/

--
-- TNAZLECH  (Table) 
--
CREATE TABLE ASU.TNAZLECH
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
  FL_ISVRACHVIEW  NUMBER(1),
  FL_MORE_PUT     NUMBER(5)                     DEFAULT 0,
  FK_DOCID        NUMBER(15),
  FK_NAZTYPEID    NUMBER(15),
  FK_NAZOWNER     NUMBER(15)                    DEFAULT -1,
  FK_NAZCAUSEID   NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          8680K
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

COMMENT ON TABLE ASU.TNAZLECH IS 'Назначения процедур
  '
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_SMID IS 'Код проводимой процедуры'
/

COMMENT ON COLUMN ASU.TNAZLECH.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TNAZLECH.FD_NAZ IS 'Дата создания назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FD_RUN IS 'Дата регистрации/проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_VRACHID IS 'Код врача, проводившего исследования'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_NAZSOSID IS 'Состояние назначения(по справочнику TNAZSOS)'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_RESULTID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZLECH.FC_NAME IS 'Название назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FL_PLAT IS 'Признак необходимости оплаты назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FC_TYPE IS 'Тип назначения'
/

COMMENT ON COLUMN ASU.TNAZLECH.FL_INS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZLECH.FL_IN_RASPIS IS 'Признак присутствия назначения в расписании'
/

COMMENT ON COLUMN ASU.TNAZLECH.FL_ISVRACHVIEW IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZLECH.FL_MORE_PUT IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TNAZLECH.FK_NAZOWNER IS 'Код назначения'
/


--
-- PK_TNAZLECH  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZLECH ON ASU.TNAZLECH
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2176K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_BY_DATA_PACID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZLECH_BY_DATA_PACID ON ASU.TNAZLECH
(FK_PACID, FD_RUN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4480K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZLECH_BY_FK_ID ON ASU.TNAZLECH
(FK_ID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2944K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_BY_ID_NAZSOSID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZLECH_BY_ID_NAZSOSID ON ASU.TNAZLECH
(FK_ID, FK_NAZSOSID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_DATE  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE INDEX ASU.TNAZLECH_DATE ON ASU.TNAZLECH
(FD_RUN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3200K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_FK_NAZSOSID_PACID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE INDEX ASU.TNAZLECH_FK_NAZSOSID_PACID ON ASU.TNAZLECH
(FK_NAZSOSID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3200K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_FK_NAZSOS_PACID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZLECH_FK_NAZSOS_PACID ON ASU.TNAZLECH
(FK_NAZSOSID, FK_PACID, FK_ID)
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
-- TNAZLECH_PACID  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE INDEX ASU.TNAZLECH_PACID ON ASU.TNAZLECH
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2432K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_SMID_INS  (Index) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE INDEX ASU.TNAZLECH_SMID_INS ON ASU.TNAZLECH
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZLECH_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TNAZLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


--
-- TNAZLECH_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_DELETE" 
 BEFORE
 DELETE
 ON asu.TNAZLECH
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
 delete from tib where fk_pacid=:old.fk_id;
 delete from treslech where fk_nazid=:old.fk_id;
 if insnaz.bins then
   return;
 end if;
 insnaz.bins:=true;
 asu.DO_CHECK_DELETE_TALON(:old.FK_ID);
 delete from vnaz where fk_id=:old.fk_id;
 insnaz.bins:=false;
 exception
    when others then
        insnaz.bins:=false;
         raise;
End;
/
SHOW ERRORS;


--
-- TNAZLECH_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_INSERT" 
 BEFORE
  INSERT
 ON tnazlech
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
BEGIN
 if insnaz.bins then
   return;
 end if;
  insnaz.bins:=true;
    SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
    insert into vnaz(fk_id, fk_smid, fc_remark, fd_naz, fd_run, fk_roomid, fk_ispolid, fk_vrachid, fk_nazsosid, fk_pacid, fk_resultid, fc_name, fl_plat, fc_type, fl_in_raspis, fl_isvrachview,FK_NAZTYPEID, FK_NAZOWNER)
      values(:new.fk_id, :new.fk_smid, :new.fc_remark, :new.fd_naz,:new.fd_run, :new.fk_roomid, :new.fk_ispolid,:new.fk_vrachid, :new.fk_nazsosid, :new.fk_pacid, :new.fk_resultid, :new.fc_name, :new.fl_plat, :new.fc_type, :new.fl_in_raspis, :new.fl_isvrachview,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


--
-- TNAZLECH_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZLECH_UPDATE" 
 BEFORE
  UPDATE
 ON tnazlech
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
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
             fl_in_raspis = :new.fl_in_raspis,fl_isvrachview = :new.fl_isvrachview, fl_more_put=:new.fl_more_put ,
             FK_NAZTYPEID = :new.FK_NAZTYPEID, FK_NAZOWNER = :new.FK_NAZOWNER
       WHERE fk_id = :old.fk_id;
  insnaz.bins:=false;
  exception
    when others then
        insnaz.bins:=false;
        raise;
end;
    END;
  END IF;
END;
/
SHOW ERRORS;


DROP SYNONYM BUH.TNAZLECH
/

--
-- TNAZLECH  (Synonym) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE SYNONYM BUH.TNAZLECH FOR ASU.TNAZLECH
/


DROP SYNONYM STAT.TNAZLECH
/

--
-- TNAZLECH  (Synonym) 
--
--  Dependencies: 
--   TNAZLECH (Table)
--
CREATE SYNONYM STAT.TNAZLECH FOR ASU.TNAZLECH
/


-- 
-- Non Foreign Key Constraints for Table TNAZLECH 
-- 
ALTER TABLE ASU.TNAZLECH ADD (
  CONSTRAINT PK_TNAZLECH
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          2176K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

