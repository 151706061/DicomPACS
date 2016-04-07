DROP TABLE ASU.TSHABLON CASCADE CONSTRAINTS
/

--
-- TSHABLON  (Table) 
--
CREATE TABLE ASU.TSHABLON
(
  FK_ID       NUMBER(15),
  FC_NAME     VARCHAR2(100 BYTE),
  FC_SHABLON  VARCHAR2(4000 BYTE),
  FK_VRACHID  NUMBER(15),
  FN_TYPE     NUMBER(2),
  FK_SMID     NUMBER(15)                        DEFAULT 0                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2880K
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

COMMENT ON TABLE ASU.TSHABLON IS 'Шаблоны'
/

COMMENT ON COLUMN ASU.TSHABLON.FK_ID IS 'SEQUENCE=[SEQ_TSHABLON]'
/

COMMENT ON COLUMN ASU.TSHABLON.FC_NAME IS 'Наименование  шаблона'
/

COMMENT ON COLUMN ASU.TSHABLON.FC_SHABLON IS 'Содержимое шаблона (текст)'
/

COMMENT ON COLUMN ASU.TSHABLON.FK_VRACHID IS 'Сотрудник создавший'
/

COMMENT ON COLUMN ASU.TSHABLON.FN_TYPE IS 'Тип шаблона, 14 - шаблон на дис карту'
/

COMMENT ON COLUMN ASU.TSHABLON.FK_SMID IS 'TSMID.FK_ID, -10 - Шаблон на checkPacData "Сведения об изменении диагноза, сопутствующих заболеваниях:"'
/


--
-- TSHABLON_BY_ID  (Index) 
--
--  Dependencies: 
--   TSHABLON (Table)
--
CREATE UNIQUE INDEX ASU.TSHABLON_BY_ID ON ASU.TSHABLON
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
-- TSHABLON_I_FK_SMID_FK_VRACHID  (Index) 
--
--  Dependencies: 
--   TSHABLON (Table)
--
CREATE INDEX ASU.TSHABLON_I_FK_SMID_FK_VRACHID ON ASU.TSHABLON
(FK_SMID, FK_VRACHID)
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
-- TSHABLON_VRACHID_TYPE_SMID  (Index) 
--
--  Dependencies: 
--   TSHABLON (Table)
--
CREATE INDEX ASU.TSHABLON_VRACHID_TYPE_SMID ON ASU.TSHABLON
(FK_VRACHID, FN_TYPE, FK_SMID)
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
-- TSHABLON_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSHABLON (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSHABLON_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSHABLON   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tshablon.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


