DROP TABLE ASU.TRESIS CASCADE CONSTRAINTS
/

--
-- TRESIS  (Table) 
--
CREATE TABLE ASU.TRESIS
(
  FK_ID        NUMBER,
  FK_SMID      NUMBER,
  FD_INS       DATE,
  FC_RES       VARCHAR2(4000 BYTE),
  FK_BLOBID    NUMBER(15),
  FN_RES       NUMBER,
  FC_TYPE      VARCHAR2(30 BYTE),
  FK_VRACHID   NUMBER,
  FK_PACID     NUMBER(15),
  FK_NAZID     NUMBER(15),
  FK_PATNAME   NUMBER(15)                       DEFAULT 0,
  FC_COMENT    VARCHAR2(100 BYTE),
  FK_SOS       NUMBER(9),
  FL_PATFIRST  NUMBER(1)                        DEFAULT 0,
  FK_PATID     NUMBER(9)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          45616K
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
ENABLE ROW MOVEMENT
/

COMMENT ON TABLE ASU.TRESIS IS 'Результаты исследований
  '
/

COMMENT ON COLUMN ASU.TRESIS.FK_ID IS 'SEQUENCE=[SEQ_TRES]'
/

COMMENT ON COLUMN ASU.TRESIS.FK_SMID IS 'Код проводимого назначения'
/

COMMENT ON COLUMN ASU.TRESIS.FD_INS IS 'Дата ввода результата'
/

COMMENT ON COLUMN ASU.TRESIS.FC_RES IS 'Текстовый результат'
/

COMMENT ON COLUMN ASU.TRESIS.FK_BLOBID IS 'Ссылка на строковый результат, хранящийся в справочнике TSMID'
/

COMMENT ON COLUMN ASU.TRESIS.FN_RES IS 'Числовой результат'
/

COMMENT ON COLUMN ASU.TRESIS.FC_TYPE IS 'Тип результата'
/

COMMENT ON COLUMN ASU.TRESIS.FK_VRACHID IS 'Врач выполнивший'
/

COMMENT ON COLUMN ASU.TRESIS.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TRESIS.FK_NAZID IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TRESIS.FK_PATNAME IS 'TPATNAME.FK_ID'
/

COMMENT ON COLUMN ASU.TRESIS.FC_COMENT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRESIS.FK_SOS IS 'Статус'
/

COMMENT ON COLUMN ASU.TRESIS.FL_PATFIRST IS 'Впервые ли выявлена патология'
/

COMMENT ON COLUMN ASU.TRESIS.FK_PATID IS 'Служебное поле'
/


--
-- TRESIS_BY_ID_PACID  (Index) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE INDEX ASU.TRESIS_BY_ID_PACID ON ASU.TRESIS
(FK_ID, FK_PACID)
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
-- TRESIS_BY_ID_PACID_INS  (Index) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE INDEX ASU.TRESIS_BY_ID_PACID_INS ON ASU.TRESIS
(FK_ID, FD_INS, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1152K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESIS_BY_INS  (Index) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE INDEX ASU.TRESIS_BY_INS ON ASU.TRESIS
(FD_INS)
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
-- TRESIS_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE INDEX ASU.TRESIS_BY_NAZID ON ASU.TRESIS
(FK_NAZID, FK_ID)
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
-- TRESIS_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESIS_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
--  SELECT SEQ_TRES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  select seq_tkarta.nextval into :new.fk_id from dual;
  insert into vres(FK_ID,FK_SMID,FD_INS,FC_RES,FK_BLOBID,FN_RES,FC_TYPE,FK_VRACHID,FK_PACID,
                   FK_NAZID,FK_PATID,FC_COMENT,FK_SOS,FL_ZAKL)
    values (:new.FK_ID, :new.FK_SMID, :new.FD_INS, :new.FC_RES, :new.FK_BLOBID, :new.FN_RES, :new.FC_TYPE, :new.FK_VRACHID, :new.FK_PACID,
            :new.FK_NAZID, :new.fk_patname, :new.FC_COMENT, :new.FK_SOS, 0);
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;
End;
/
SHOW ERRORS;


DROP SYNONYM STAT.TRESIS
/

--
-- TRESIS  (Synonym) 
--
--  Dependencies: 
--   TRESIS (Table)
--
CREATE SYNONYM STAT.TRESIS FOR ASU.TRESIS
/


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TRESIS TO MMS
/

