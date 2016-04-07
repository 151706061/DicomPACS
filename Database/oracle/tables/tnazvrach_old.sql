DROP TABLE ASU.TNAZVRACH_OLD CASCADE CONSTRAINTS
/

--
-- TNAZVRACH_OLD  (Table) 
--
CREATE TABLE ASU.TNAZVRACH_OLD
(
  FK_ID         NUMBER(15),
  FK_SMID       NUMBER(15),
  FK_SOTRID     NUMBER(15),
  FK_KABINETID  NUMBER(15),
  FN_NORMPROC   NUMBER(6,2),
  FL_PRIEM      NUMBER                          DEFAULT 0,
  FN_DOSTUP     NUMBER(15),
  FN_PODPIS     NUMBER(15),
  FL_ACCESS     NUMBER                          DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          880K
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

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FK_ID IS 'SEQUENCE=[SEQ_TNAZVRACH]'
/

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FK_SMID IS 'Код назначения по справочнику TSMID'
/

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FK_SOTRID IS 'Код сотрудника'
/

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FK_KABINETID IS 'Код кабинета'
/

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FN_NORMPROC IS 'Количество процедур в день для кабинета'
/

COMMENT ON COLUMN ASU.TNAZVRACH_OLD.FL_PRIEM IS 'Служебное поле'
/


--
-- TNAZVRACH_BY_KABINETID  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE INDEX ASU.TNAZVRACH_BY_KABINETID ON ASU.TNAZVRACH_OLD
(FK_KABINETID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH_ID  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE UNIQUE INDEX ASU.TNAZVRACH_ID ON ASU.TNAZVRACH_OLD
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH#ID$DESC  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE UNIQUE INDEX ASU.TNAZVRACH#ID$DESC ON ASU.TNAZVRACH_OLD
("FK_ID" DESC)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12672K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH_KAB_SOTR  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE INDEX ASU.TNAZVRACH_KAB_SOTR ON ASU.TNAZVRACH_OLD
("FK_SOTRID" DESC, "FK_KABINETID" DESC)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH_SMID  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE INDEX ASU.TNAZVRACH_SMID ON ASU.TNAZVRACH_OLD
(FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH$SOTRID  (Index) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE INDEX ASU.TNAZVRACH$SOTRID ON ASU.TNAZVRACH_OLD
(FK_SOTRID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZVRACH_LOG  (Trigger) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZVRACH_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TNAZVRACH_OLD  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TNAZVRACH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_SMID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_smid), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_SOTRID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_sotrid), null, :old.fk_id);
    PKG_LOG.Do_log('TNAZVRACH', 'FK_KABINETID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_kabinetid), null, :old.fk_id);
  end if;
  null;
END TNAZVRACH_LOG;
/
SHOW ERRORS;


--
-- TNAZVRACH_DELETE  (Trigger) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZVRACH_DELETE" 
  BEFORE INSERT
  ON ASU.TNAZVRACH_OLD   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
declare
cursor c2 is select 'Есть' from dual where exists (select fc_name from vnaz where fk_roomid = :old.fk_kabinetid and fk_ispolid=:old.fk_sotrid);
Begin
  open c2;
  if not c2%notfound then
    raise_application_error(-20001, 'Этот врач уже проводил в этом кабинете назначения');
    close c2;
    return;
  end if;
End;
/
SHOW ERRORS;


--
-- TNAZVRACH_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZVRACH_OLD (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZVRACH_BEFOR_INSERT" 
  BEFORE INSERT
  ON ASU.TNAZVRACH_OLD   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_tnazvrach.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


