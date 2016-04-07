DROP TABLE ASU.TSROKY CASCADE CONSTRAINTS
/

--
-- TSROKY  (Table) 
--
CREATE TABLE ASU.TSROKY
(
  FK_ID        NUMBER(15),
  FK_PACID     NUMBER(15),
  FK_PRYB      NUMBER(1),
  FK_VYB       NUMBER(1),
  FN_KOL       NUMBER(3),
  FD_DATA1     DATE,
  FD_DATA2     DATE,
  FD_DATA3     DATE,
  FN_SUM       NUMBER,
  FK_OPLID     NUMBER(16)                       DEFAULT -1,
  FL_BUH       NUMBER(15)                       DEFAULT -1,
  FC_DOCUMENT  VARCHAR2(30 BYTE),
  FK_VYBID     NUMBER(15)                       DEFAULT -1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          3560K
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

COMMENT ON TABLE ASU.TSROKY IS 'Сроки проживания пациента by TimurLan'
/

COMMENT ON COLUMN ASU.TSROKY.FK_ID IS 'SEQUENCE=[SEQ_TSROKY]'
/

COMMENT ON COLUMN ASU.TSROKY.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TSROKY.FK_PRYB IS 'код прибытия'
/

COMMENT ON COLUMN ASU.TSROKY.FK_VYB IS 'код выбыития'
/

COMMENT ON COLUMN ASU.TSROKY.FN_KOL IS 'к-во дней'
/

COMMENT ON COLUMN ASU.TSROKY.FD_DATA1 IS 'дата начала'
/

COMMENT ON COLUMN ASU.TSROKY.FD_DATA2 IS 'дата окончания планируемая'
/

COMMENT ON COLUMN ASU.TSROKY.FD_DATA3 IS 'дата окончания фактическая'
/

COMMENT ON COLUMN ASU.TSROKY.FN_SUM IS 'сумма'
/

COMMENT ON COLUMN ASU.TSROKY.FK_OPLID IS 'признак оплаты'
/

COMMENT ON COLUMN ASU.TSROKY.FL_BUH IS 'признак бухгалтерии'
/

COMMENT ON COLUMN ASU.TSROKY.FC_DOCUMENT IS 'номер путевки'
/

COMMENT ON COLUMN ASU.TSROKY.FK_VYBID IS 'причина выбытия пациента (TVYBTYPE)'
/


--
-- TSROKY_BY_D1D3_PRYB  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE INDEX ASU.TSROKY_BY_D1D3_PRYB ON ASU.TSROKY
(FD_DATA1, FD_DATA3, FK_PRYB)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2304K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSROKY_BY_D1_D3_P_VYB_PACID_ID  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE UNIQUE INDEX ASU.TSROKY_BY_D1_D3_P_VYB_PACID_ID ON ASU.TSROKY
(FD_DATA1, FD_DATA3, FK_PRYB, FK_VYB, FK_PACID, 
FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3328K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSROKY_BY_ID  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE UNIQUE INDEX ASU.TSROKY_BY_ID ON ASU.TSROKY
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSROKY_BY_ID_PACID  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE UNIQUE INDEX ASU.TSROKY_BY_ID_PACID ON ASU.TSROKY
(FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1408K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSROKY_BY_ID_PACID_PRYB_D1_D3  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE UNIQUE INDEX ASU.TSROKY_BY_ID_PACID_PRYB_D1_D3 ON ASU.TSROKY
(FK_ID, FK_PRYB, FK_PACID, FD_DATA1, FD_DATA3)
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
-- TSROKY_PRIB_TDATA1  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE INDEX ASU.TSROKY_PRIB_TDATA1 ON ASU.TSROKY
(FK_PRYB, TRUNC("FD_DATA1"))
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
-- TSROKY_PRYB_PACID  (Index) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE UNIQUE INDEX ASU.TSROKY_PRYB_PACID ON ASU.TSROKY
(FK_ID, FK_PRYB, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSROKY_AFTER_DELETE  (Trigger) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_AFTER_DELETE" 
  AFTER DELETE ON ASU.TSROKY   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  DELETE FROM TPERESEL WHERE FK_SROKID = :OLD.FK_ID;
End;
/
SHOW ERRORS;


--
-- TSROKY_AFTER_INSERT_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_AFTER_INSERT_UPDATE" 
  BEFORE INSERT OR UPDATE ON ASU.TSROKY   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  --Rem by TimurLan
  --  if :NEW.FK_PRYB IN (1,2,4,5,6) then
  --    :NEW.FD_DATA2:=:NEW.FD_DATA1+:NEW.FN_KOL-1;
  --    if :NEW.FK_VYB=0 then
  --      :NEW.FD_DATA3:=:NEW.FD_DATA2;
  --    end if;
  --  end if;
  null;
End;
/
SHOW ERRORS;


--
-- TSROKY_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TSROKY   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TSROKY.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


--
-- TSROKY_LOG  (Trigger) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TSROKY  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PACID), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_PRYB), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYB', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VYB), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_KOL), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA1), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA2), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FD_DATA3), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FN_SUM), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_OPLID), :new.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_VYBID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PRYB), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYB', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VYB), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_KOL), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA1), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA2), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_DATA3), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'DELETE', PKG_LOG.GET_VALUE(:old.FN_SUM), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_OPLID), null, :old.fk_id);
    PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VYBID), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TSROKY', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FK_PACID') /*AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID)*/ then
      PKG_LOG.Do_log('TSROKY', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
    if UPDATING ('FK_PRYB') /*AND PKG_LOG.GET_VALUE(:old.FK_PRYB) <> PKG_LOG.GET_VALUE(:new.FK_PRYB) */then
      PKG_LOG.Do_log('TSROKY', 'FK_PRYB', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PRYB), PKG_LOG.GET_VALUE(:new.FK_PRYB), :old.fk_id);
    end if;
    if UPDATING ('FN_KOL') AND PKG_LOG.GET_VALUE(:old.FN_KOL) <> PKG_LOG.GET_VALUE(:new.FN_KOL) then
      PKG_LOG.Do_log('TSROKY', 'FN_KOL', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_KOL), PKG_LOG.GET_VALUE(:new.FN_KOL), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA1') /*AND PKG_LOG.GET_VALUE(:old.FD_DATA1) <> PKG_LOG.GET_VALUE(:new.FD_DATA1) */then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA1', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA1), PKG_LOG.GET_VALUE(:new.FD_DATA1), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA2') AND PKG_LOG.GET_VALUE(:old.FD_DATA2) <> PKG_LOG.GET_VALUE(:new.FD_DATA2) then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA2', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA2), PKG_LOG.GET_VALUE(:new.FD_DATA2), :old.fk_id);
    end if;
    if UPDATING ('FD_DATA3') AND PKG_LOG.GET_VALUE(:old.FD_DATA3) <> PKG_LOG.GET_VALUE(:new.FD_DATA3) then
      PKG_LOG.Do_log('TSROKY', 'FD_DATA3', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATA3), PKG_LOG.GET_VALUE(:new.FD_DATA3), :old.fk_id);
    end if;
    if UPDATING ('FN_SUM') AND PKG_LOG.GET_VALUE(:old.FN_SUM) <> PKG_LOG.GET_VALUE(:new.FN_SUM) then
      PKG_LOG.Do_log('TSROKY', 'FN_SUM', 'UPDATE', PKG_LOG.GET_VALUE(:old.FN_SUM), PKG_LOG.GET_VALUE(:new.FN_SUM), :old.fk_id);
    end if;
    if UPDATING ('FK_OPLID') AND PKG_LOG.GET_VALUE(:old.FK_OPLID) <> PKG_LOG.GET_VALUE(:new.FK_OPLID) then
      PKG_LOG.Do_log('TSROKY', 'FK_OPLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_OPLID), PKG_LOG.GET_VALUE(:new.FK_OPLID), :old.fk_id);
    end if;
    if UPDATING ('FK_VYBID') AND PKG_LOG.GET_VALUE(:old.FK_VYBID) <> PKG_LOG.GET_VALUE(:new.FK_VYBID) then
      PKG_LOG.Do_log('TSROKY', 'FK_VYBID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VYBID), PKG_LOG.GET_VALUE(:new.FK_VYBID), :old.fk_id);
    end if;
  end if;
  null;
END TSROKY_LOG;
/
SHOW ERRORS;


--
-- TSROKY_TO_TIB$UPD$INS  (Trigger) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSROKY_TO_TIB$UPD$INS" 
AFTER  INSERT  OR UPDATE  ON ASU.TSROKY REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
DISABLE
BEGIN
--вставка в историю болезни данных эпиданамнеза
   IF :new.fk_pryb = 2 THEN
      DELETE FROM tib
       WHERE fk_pacid = :old.fk_id
         AND fk_smeditid = get_synid ('EPID_PRYB_DATA');
      INSERT INTO tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
          VALUES (:new.fk_pacid, TO_CHAR (:new.fd_data1, 'dd.mm.yyyy'), get_synid ('EPID_PRYB_DATA'), get_synid ('EPID_PRYB_DATA'));
   END IF;
END;
/
SHOW ERRORS;


DROP SYNONYM BUH.TSROKY
/

--
-- TSROKY  (Synonym) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE SYNONYM BUH.TSROKY FOR ASU.TSROKY
/


DROP SYNONYM FOOD.TS_REGISTR_SROKY
/

--
-- TS_REGISTR_SROKY  (Synonym) 
--
--  Dependencies: 
--   TSROKY (Table)
--
CREATE SYNONYM FOOD.TS_REGISTR_SROKY FOR ASU.TSROKY
/


GRANT DELETE, INDEX, INSERT, REFERENCES, UPDATE ON ASU.TSROKY TO BUH
/

