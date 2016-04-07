ALTER TABLE ASU.TPERESEL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPERESEL CASCADE CONSTRAINTS
/

--
-- TPERESEL  (Table) 
--
CREATE TABLE ASU.TPERESEL
(
  FK_ID          NUMBER(15)                     DEFAULT -1,
  FK_PALATAID    NUMBER(15)                     DEFAULT -1,
  FK_PACID       NUMBER(15)                     DEFAULT -1,
  FD_DATA1       DATE,
  FD_DATA2       DATE,
  FK_SROKID      NUMBER(15)                     DEFAULT -1,
  FL_BUH         NUMBER                         DEFAULT 0,
  FK_KOYKAVIDID  NUMBER,
  FK_DOCOBSLID   NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1840K
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

COMMENT ON TABLE ASU.TPERESEL IS 'таблица переселений пациента by TimurLan'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_ID IS 'SEQUENCE=[SEQ_TPERESEL]'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_PALATAID IS 'TROOM.FK_ID'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TPERESEL.FD_DATA1 IS 'начало периода'
/

COMMENT ON COLUMN ASU.TPERESEL.FD_DATA2 IS 'конец периода'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_SROKID IS 'TSROKY.FK_ID'
/

COMMENT ON COLUMN ASU.TPERESEL.FL_BUH IS 'отметка бухгалтерии'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_KOYKAVIDID IS 'Профиль койки'
/

COMMENT ON COLUMN ASU.TPERESEL.FK_DOCOBSLID IS 'Ссылка на вид док-та обслуживания TDocObsl'
/


--
-- TPERESEL_BY_FD_DATA1_DATA2  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_BY_FD_DATA1_DATA2 ON ASU.TPERESEL
(FD_DATA1, FD_DATA2)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1664K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPERESEL_BY_FD_DATA2  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_BY_FD_DATA2 ON ASU.TPERESEL
(FD_DATA2)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1536K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPERESEL_BY_FK_PALATAID  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_BY_FK_PALATAID ON ASU.TPERESEL
(FK_PALATAID, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          896K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPERESEL_BY_ID  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE UNIQUE INDEX ASU.TPERESEL_BY_ID ON ASU.TPERESEL
(FK_ID)
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
-- TPERESEL_BY_PACID  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_BY_PACID ON ASU.TPERESEL
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPERESEL_FD_DATA1  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_FD_DATA1 ON ASU.TPERESEL
(FD_DATA1)
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
-- TPERESEL$FK_DOCOBSLID  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL$FK_DOCOBSLID ON ASU.TPERESEL
(FK_DOCOBSLID)
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
-- TPERESEL_I_FD_DATA2_FD_DATA1  (Index) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE INDEX ASU.TPERESEL_I_FD_DATA2_FD_DATA1 ON ASU.TPERESEL
(FD_DATA2, FD_DATA1)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1920K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TPERESEL_SET_FK_SROKID  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL_SET_FK_SROKID" 
 BEFORE 
 INSERT OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
CURSOR cTemp IS SELECT /*+rule*/ FK_ID,FD_DATA1,FD_DATA3,FK_PRYB FROM TSROKY WHERE FK_PACID=:NEW.FK_PACID ORDER BY FK_ID;
--CURSOR cPer IS SELECT /*+rule*/  FD_DATA1 FROM TPERESEL WHERE FK_PACID=:OLD.FK_PACID;
dTemp DATE;
Data1 DATE;
Data2 DATE;
nPryb NUMBER;
nSrokID NUMBER;
nTSrokID NUMBER;
nTemp NUMBER;
Begin
  dTemp:=:NEW.FD_DATA1;
    OPEN cTemp;
    nSrokID:=0;
    LOOP
    FETCH cTemp INTO nTSrokID,Data1,Data2,nPryb;
    EXIT WHEN cTemp%NOTFOUND;
    if nPryb IN (2,4) then
--    raise_application_error(-20002,to_char(nPryb));
      nSrokID:=nTSrokID;
      if dTemp BETWEEN Data1 AND Data2 AND nSrokID>0 then
        :NEW.FK_SROKID:=nSrokID;
      --  raise_application_error(-20002,to_char(dTemp)||' pryb '||to_char(nPryb));
        EXIT;
      end if;
    end if;
  END LOOP;
  CLOSE cTemp;
End;
/
SHOW ERRORS;


--
-- TPERESEL_LOG  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PALATAID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PACID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA1), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA2), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_SROKID), :new.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PALATAID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA1), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA2), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_SROKID), null, :old.fk_id);
    PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TPERESEL', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_PALATAID') AND PKG_LOG.GET_VALUE(:old.FK_PALATAID) <> PKG_LOG.GET_VALUE(:new.FK_PALATAID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_PALATAID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PALATAID), PKG_LOG.GET_VALUE(:new.FK_PALATAID), :old.fk_id);
    end if;
    if UPDATING ('FK_PACID') AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA1') AND PKG_LOG.GET_VALUE(:old.FD_DATA1) <> PKG_LOG.GET_VALUE(:new.FD_DATA1) then
      PKG_LOG.Do_log('TPERESEL', 'FD_DATA1', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA1), PKG_LOG.GET_VALUE(:new.FD_DATA1), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA2') AND PKG_LOG.GET_VALUE(:old.FD_DATA2) <> PKG_LOG.GET_VALUE(:new.FD_DATA2) then
      PKG_LOG.Do_log('TPERESEL', 'FD_DATA2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA2), PKG_LOG.GET_VALUE(:new.FD_DATA2), :old.fk_id);
    end if;
    if UPDATING ('FK_SROKID') AND PKG_LOG.GET_VALUE(:old.FK_SROKID) <> PKG_LOG.GET_VALUE(:new.FK_SROKID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_SROKID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_SROKID), PKG_LOG.GET_VALUE(:new.FK_SROKID), :old.fk_id);
    end if;
    if UPDATING ('FK_DOCOBSLID') AND PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID) <> PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID) then
      PKG_LOG.Do_log('TPERESEL', 'FK_DOCOBSLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_DOCOBSLID), PKG_LOG.GET_VALUE(:new.FK_DOCOBSLID), :old.fk_id);
    end if;
  end if;
  null;
END TPERESEL_LOG;
/
SHOW ERRORS;


--
-- TPERESEL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TPERESEL REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TPERESEL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TPERESEL$BIUDS$KARTA  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$BIUDS$KARTA" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
BEGIN
  -- инициализирует коллекцию измененных карт для переселов
  -- Author: Zhukov
  ASU.pkg_peresel.INIT_TABLES;
END;
/
SHOW ERRORS;


--
-- TPERESEL$BIUD$KARTA  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$BIUD$KARTA" 
 BEFORE
 INSERT OR DELETE OR UPDATE
 ON ASU.TPERESEL  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  -- запоминаем измененные краты для обхода мутации
  --AUTHOR: ZHUKOV
  IF INSERTING
  THEN
    IF :NEW.FK_PACID IS NOT NULL
    THEN
      pkg_peresel.ADD_karta_to_list (:NEW.FK_PACID);
    END IF;
  END IF;

  IF UPDATING ('FK_PACID') OR UPDATING ('FK_PALATAID')
  THEN
    pkg_peresel.ADD_karta_to_list (:NEW.FK_PACID);
  END IF;

  IF DELETING
  THEN
    pkg_peresel.ADD_karta_to_list (:OLD.FK_PACID);
  END IF;
END;
/
SHOW ERRORS;


--
-- TPERESEL$AIUDS$KARATA  (Trigger) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$AIUDS$KARATA" 
  AFTER INSERT OR DELETE OR UPDATE ON ASU.TPERESEL   REFERENCING OLD AS OLD NEW AS NEW
begin
-- iaiiaeyao o niioaaonao?ueo caienae a TKARTA oaeouo? iaeaoo
-- iaoiaei iooaoe? oaaeeo
if not INSNAZ.BINS then ASU.pkg_peresel.SET_TKARTA_FK_ROOM; end if; end;
/
SHOW ERRORS;


DROP SYNONYM FOOD.TS_PERESEL
/

--
-- TS_PERESEL  (Synonym) 
--
--  Dependencies: 
--   TPERESEL (Table)
--
CREATE SYNONYM FOOD.TS_PERESEL FOR ASU.TPERESEL
/


-- 
-- Non Foreign Key Constraints for Table TPERESEL 
-- 
ALTER TABLE ASU.TPERESEL ADD (
  CONSTRAINT PK_TPERESEL
 PRIMARY KEY
 (FK_ID))
/

GRANT REFERENCES, SELECT ON ASU.TPERESEL TO EXCHANGE
/

GRANT REFERENCES, SELECT ON ASU.TPERESEL TO EXCH43
/

