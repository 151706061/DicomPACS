DROP TABLE ASU.TTECHBOLEZNI CASCADE CONSTRAINTS
/

--
-- TTECHBOLEZNI  (Table) 
--
CREATE TABLE ASU.TTECHBOLEZNI
(
  FK_ID       NUMBER(15),
  FD_DATE     DATE,
  FK_VRACHID  NUMBER(15),
  FK_PACID    NUMBER(15),
  FC_COMMENT  VARCHAR2(4000 BYTE),
  FK_TYPE     NUMBER(1),
  FK_TIBID    NUMBER(9),
  FP_STOM     NUMBER                            DEFAULT 0,
  FK_STIM     NUMBER,
  FP_CHILD    NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1120K
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

COMMENT ON TABLE ASU.TTECHBOLEZNI IS 'Приемы by TimurLan '
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FD_DATE IS 'Дата записи'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_VRACHID IS 'код врача занесшего запись'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FC_COMMENT IS 'комментарии [!!!!!!!!!!Надо удалить!!!!!!!!]'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_TYPE IS '0-  лечащий врач, 1- дежурный врач'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_TIBID IS 'Код FK_PACID в TIB в котором хранятся данные о приеме'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FP_STOM IS 'Для стоматолога вроде. добавил TimurLan 22/10/2003'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FK_STIM IS 'Для стоматолога вроде. добавил TimurLan 22/10/2003'
/

COMMENT ON COLUMN ASU.TTECHBOLEZNI.FP_CHILD IS 'Для стоматолога вроде. добавил TimurLan 22/10/2003'
/


--
-- TTECHBOLEZNI_BY_PACID  (Index) 
--
--  Dependencies: 
--   TTECHBOLEZNI (Table)
--
CREATE INDEX ASU.TTECHBOLEZNI_BY_PACID ON ASU.TTECHBOLEZNI
(FK_PACID)
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
-- TTECHBOLEZNI_LOG  (Trigger) 
--
--  Dependencies: 
--   TTECHBOLEZNI (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTECHBOLEZNI_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TTECHBOLEZNI  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FD_DATE', 'INSERT', PKG_LOG.GET_VALUE(:old.FD_DATE), PKG_LOG.GET_VALUE(:new.FD_DATE), :new.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_VRACHID', 'INSERT', PKG_LOG.GET_VALUE(:old.FK_VRACHID), PKG_LOG.GET_VALUE(:new.FK_VRACHID), :new.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_PACID', 'INSERT', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :new.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FP_STOM', 'INSERT', PKG_LOG.GET_VALUE(:old.FP_STOM), PKG_LOG.GET_VALUE(:new.FP_STOM), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATE), null, :old.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_VRACHID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), null, :old.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FP_STOM', 'DELETE', PKG_LOG.GET_VALUE(:old.FP_STOM), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FD_DATE') AND PKG_LOG.GET_VALUE(:old.FD_DATE) <> PKG_LOG.GET_VALUE(:new.FD_DATE) then
      PKG_LOG.Do_log('TTECHBOLEZNI', 'FD_DATE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATE), PKG_LOG.GET_VALUE(:new.FD_DATE), :old.fk_id);
    end if;
    if UPDATING ('FK_VRACHID') AND PKG_LOG.GET_VALUE(:old.FK_VRACHID) <> PKG_LOG.GET_VALUE(:new.FK_VRACHID) then
      PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_VRACHID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), PKG_LOG.GET_VALUE(:new.FK_VRACHID), :old.fk_id);
    end if;
    if UPDATING ('FK_PACID') AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID) then
      PKG_LOG.Do_log('TTECHBOLEZNI', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
    if UPDATING ('FP_STOM') AND PKG_LOG.GET_VALUE(:old.FP_STOM) <> PKG_LOG.GET_VALUE(:new.FP_STOM) then
      PKG_LOG.Do_log('TTECHBOLEZNI', 'FP_STOM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FP_STOM), PKG_LOG.GET_VALUE(:new.FP_STOM), :old.fk_id);
    end if;
  end if;
END;
/
SHOW ERRORS;


--
-- TTECHBOLEZNI_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TTECHBOLEZNI (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTECHBOLEZNI_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TTECHBOLEZNI   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  select seq_tkarta.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TTECHBOLEZNI_AFTER_DEL  (Trigger) 
--
--  Dependencies: 
--   TTECHBOLEZNI (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTECHBOLEZNI_AFTER_DEL" 
  AFTER DELETE ON ASU.TTECHBOLEZNI   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  delete from tib where fk_pacid = :old.fk_tibid;
  if :old.fk_stim is not null then --by TimurLan
    delete from tstompos where fk_picsid = :old.fk_stim;
    delete from tstomres where fk_stomnaz = :old.fk_stim;
  end if;
  delete from tpics where fk_nazid = :old.fk_id; --by TimurLan
End;
/
SHOW ERRORS;


